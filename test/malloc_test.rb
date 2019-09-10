# Rubinius WebAssembly VM
# Copyright (c) 2019, Laurent Julliard and contributors
# All rights reserved.

require 'test_helper'
require 'wasmer'

class MallocTest < Minitest::Test

  erb_filename = __FILE__.gsub(/\.rb$/,'.erb')
  wasm_path = build_wasm(erb_filename)
  @@bytes = File.read(wasm_path)

  def setup
    @instance = Wasmer::Instance.new(@@bytes)
  end

  def test_initial_memory_size
    assert_equal 1, @instance.exports.memory_size
  end

  def test_set_base_header
    @instance.exports.set_freep(20)
    assert_equal 20, @instance.exports.get_freep
    assert_equal 0, @instance.exports.get_hdr_ptr(20)
    assert_equal 0, @instance.exports.get_hdr_size(20)
  end

  def test_set_freep
    value = 0x12345678
    freep_addr = 28
    #p @instance.exports.methods
    @instance.exports.set_freep(value)
    # check both get_freep  and memory direct read
    assert_equal value, @instance.exports.get_freep()
    assert_equal value, @instance.memory.int32_view[freep_addr/4]
    #puts '%08x' % @instance.exports.get_freep()
    #puts '%08x' % @instance.memory.int32_view[28/4]
  end

  def test_initial_break
    assert_equal @instance.exports.global_heap, @instance.exports.sbrk(0)
    assert_equal 0, @instance.exports.global_heap_size
  end

  # ------------ Test sbrk ---------------

  # allocate the first 1K bloc
  def test_sbrk_1024_allocation
    assert_equal @instance.exports.global_heap, @instance.exports.sbrk(1024)
    assert_equal 1024, @instance.exports.global_heap_size
    assert_equal @instance.exports.global_heap + @instance.exports.global_heap_size, @instance.exports.sbrk(0)
    assert_equal 1, @instance.exports.memory_size # mem size must be unchanged
  end

  # allocate a second 1024 block
  def test_sbrk_2x1024
    test_sbrk_1024_allocation

    # new break must be at offset 1024
    assert_equal @instance.exports.global_heap+1024, @instance.exports.sbrk(1024)
    assert_equal 2*1024, @instance.exports.global_heap_size
    assert_equal @instance.exports.global_heap + @instance.exports.global_heap_size, @instance.exports.sbrk(0)
    assert_equal 1, @instance.exports.memory_size # mem size must be unchanged
  end

  # allocate 1024 plus a second 65536 - 1024 - 1 bytes block. 
  # It should still fit in the first WASM page
  def test_sbrk_1024_plus_whats_left_minus_1
    test_sbrk_1024_allocation
    wasm_mem_pages = @instance.exports.memory_size
    heap_break = @instance.exports.global_heap + @instance.exports.global_heap_size
    # how much to allocate before an additional page is allocated
    whats_left = (wasm_mem_pages * 65536) - heap_break

    # new break must be at offset 1024
    assert_equal @instance.exports.global_heap+1024, @instance.exports.sbrk(whats_left-1)
    assert_equal (1024 + whats_left - 1), @instance.exports.global_heap_size
    assert_equal 1, @instance.exports.memory_size # mem size must be unchanged
  end

  # allocate 1024 plus a second 65536 - 1024 bytes block. 
  # It should allocate an additional WASM page
  def test_sbrk_1024_plus_whats_left
    test_sbrk_1024_allocation
    wasm_mem_pages = @instance.exports.memory_size
    heap_break = @instance.exports.global_heap + @instance.exports.global_heap_size
    # how much to allocate before an additional page is allocated
    whats_left = (wasm_mem_pages * 65536) - heap_break

    # new break must be at offset 1024
    assert_equal @instance.exports.global_heap+1024, @instance.exports.sbrk(whats_left)
    assert_equal (1024 + whats_left), @instance.exports.global_heap_size
    assert_equal 2, @instance.exports.memory_size # mem size must be unchanged
  end

  # allocate a series of 520 blocks and check memory is not corrupted
  def test_sbrk_520_bytes_series
    ptrs = []
    count = 128
    size = 520
    0.upto(count-1) do |i|
      ptrs[i] = @instance.exports.sbrk(520)
      #puts "#{i}: #{ptrs[i]}"
      # write byte pattern value i in the allocated mem
      0.upto(size-1) { |offset| @instance.memory.uint8_view[ptrs[i]+offset] = i}
    end
  
    # check that no block was corrupted
    ptrs.each_with_index do |ptr, i|
      0.upto(size-1) { |offset| assert_equal i, @instance.memory.uint8_view[ptr+offset] }
    end

    assert_equal 2, @instance.exports.memory_size
  end

  # ------------ Test morecore -------------
  def test_morecore_on_empty_list
    @instance.exports.set_freep(20) # freep = base address
    hdr_ptr = @instance.exports.morecore(2) # 2 units = 16 bytes
    log_free_chain("morecore 2 units")
    assert_equal 20, hdr_ptr
  end

  # ------------ Test malloc ---------------

  # malloc'ing 8 bytes should actually allocate 8+8 bytes as above
  def test_malloc_first_8_bytes
    # malloc'ed space should be right after the header (hence the +8)
    ptr = @instance.exports.malloc(8)

    # The first malloc triggers NALLOC * 8 bytes allocated to heap
    assert_equal 8*1024, @instance.exports.global_heap_size 
    assert_equal @instance.exports.global_heap + @instance.exports.global_heap_size, @instance.exports.sbrk(0)

    # The 8 bytes allocated is taken from the end of the free block
    #puts "ptr: #{ptr}"
    assert_equal @instance.exports.sbrk(0) - 8, ptr

    # Free chain should look like this
    # freep: 20 -> @20 (ptr: 10024, size: 0) -> @10024 (ptr: 20, size: 1022)
    log_free_chain("after malloc")
    
    freep = @instance.exports.get_freep
    assert_equal 20, freep
    assert_equal @instance.exports.global_heap, @instance.exports.get_hdr_ptr(freep)
    assert_equal 0, @instance.exports.get_hdr_size(freep)
    assert_equal freep, @instance.exports.get_hdr_ptr(@instance.exports.get_hdr_ptr(freep))
    assert_equal 1024 - 2, @instance.exports.get_hdr_size(@instance.exports.get_hdr_ptr(freep))
  end


  # malloc'ing 4 bytes should also allocate 8+8 bytes as above
  def test_malloc_first_4_bytes
    # malloc'ed space should be right after the header (hence the +8)
    ptr = @instance.exports.malloc(4)

    # The first malloc triggers NALLOC * 8 bytes allocated to heap
    assert_equal 8*1024, @instance.exports.global_heap_size 
    assert_equal @instance.exports.global_heap + @instance.exports.global_heap_size, @instance.exports.sbrk(0)

    # The 8 bytes allocated is taken from the end of the free block
    #puts "ptr: #{ptr}"
    assert_equal @instance.exports.sbrk(0) - 8, ptr

    # Free chain should look like this
    # freep: 20 -> @20 (ptr: 10024, size: 0) -> @10024 (ptr: 20, size: 1022)
    log_free_chain("after malloc")
  end

  # malloc a series of 512 bytes up to growing the WASM memory
  # by one more page
  def test_malloc_512_bytes_series
    ptrs = []
    count = 128
    size = 512
    0.upto(count-1) do |i|
      ptrs[i] = @instance.exports.malloc(size)
      #puts "#{i}: #{ptrs[i]}"
      # write byte pattern value i in the allocated mem
      0.upto(size-1) { |offset| @instance.memory.uint8_view[ptrs[i]+offset] = i}
    end

    # check that no block was corrupted
    ptrs.each_with_index do |ptr, i|
      0.upto(size-1) { |offset| assert_equal i, @instance.memory.uint8_view[ptr+offset] }
    end

    assert_equal 2, @instance.exports.memory_size
    log_free_chain("after malloc")
  end

  # ------------ Test free ---------------

  def test_free_first_block
    ptr = @instance.exports.malloc(24)
    # The 24 bytes allocated are taken from the end of the free block
    #puts "ptr: #{ptr}"
    assert_equal @instance.exports.sbrk(0) - 24, ptr
    log_free_chain("after malloc")

    @instance.exports.free(ptr)
    # after freeing the only allocated block the free chain looks like this
    # The first free block in the chain should be 1024 units again as before the malloc
    # freep: 10024 -> @10024 (ptr: 20, size: 1024) -> @20 (ptr: 10024, size: 0)
    log_free_chain("after free")
    assert_equal 1024, @instance.exports.get_hdr_size(@instance.exports.get_freep)
  end

  def test_free_first_block_of_two
    # allocate first block and second block
    ptr1 = @instance.exports.malloc(24)  # 18192
    ptr2 = @instance.exports.malloc(128) # 18056
    puts "#{ptr1}, #{ptr2}"
    log_free_chain("after 2 malloc")

    # free first block
    @instance.exports.free(ptr1)
    # after freeing the only allocated block the free chain looks like this
    # freep: 10024 -> @10024 (ptr: 18184, size: 1003) -> @18184 (ptr: 20, size: 4) -> @20 (ptr: 10024, size: 0)    @instance.exports.free(ptr1)
    log_free_chain("after free")
    assert_equal ptr1-8, (fp = find_free_block(ptr1-8))
    assert_equal 4, @instance.exports.get_hdr_size(fp) # a 4 units block should be free'd
  end

  def test_free_first_block_of_two_and_alloc_smaller
    # allocate first block and second block
    ptr1 = @instance.exports.malloc(24)  # 18192
    ptr2 = @instance.exports.malloc(128) # 18056

    # free first block and alloc smaller
    @instance.exports.free(ptr1)
    log_free_chain("after free ptr1")
    ptr3 = @instance.exports.malloc(16)
    log_free_chain("after smaller alloc ptr2")

    assert_equal ptr1+(24-16), ptr3
  end

  def test_free_all_allocated_blocks
    # allocate first block and second block
    ptr1 = @instance.exports.malloc(32)
    ptr2 = @instance.exports.malloc(128)
    ptr3 = @instance.exports.malloc(256)
    ptr4 = @instance.exports.malloc(512)
    log_free_chain("after 4 malloc")

    # After malloc's The free block size should 904 units long
    assert_equal @instance.exports.global_heap, (fp = find_free_block(@instance.exports.global_heap))
    assert_equal 1024 - (32+8+128+8+256+8+512+8)/8, @instance.exports.get_hdr_size(fp)

    # free first block and alloc smaller
    @instance.exports.free(ptr1)
    log_free_chain("after free ptr1")
    @instance.exports.free(ptr2)
    log_free_chain("after free ptr2")
    @instance.exports.free(ptr3)
    log_free_chain("after free ptr3")
    @instance.exports.free(ptr4)
    log_free_chain("after free ptr4")

    # After free's The free block size should be back to 1024 units
    assert_equal @instance.exports.global_heap, (fp = find_free_block(@instance.exports.global_heap))
    assert_equal 1024, @instance.exports.get_hdr_size(fp)
  end

  # ------- malloc test helpers --------

  def log_free_chain(label)
    p_base = @instance.exports.get_freep()
    printf("Free chain in #{caller[0][/`.*'/][1..-2]} - %s\n", label)
    printf("freep: %d", p_base)
    p = p_base
    loop do
      printf(" -> @%d (ptr: %d, size: %d)", p, @instance.exports.get_hdr_ptr(p), @instance.exports.get_hdr_size(p))
      p = @instance.exports.get_hdr_ptr(p)
      break if (p == 0 || p == p_base)
    end
    print("\n\n")
  end

  def find_free_block(address)
    p_base = @instance.exports.get_freep()
    p = p_base
    found_block = nil
    loop do
      break if (found_block = p) == address
      p = @instance.exports.get_hdr_ptr(p)
      break if (p == 0 || p == p_base)
    end
    found_block
  end
end