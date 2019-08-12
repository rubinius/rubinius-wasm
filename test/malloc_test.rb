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
    # According to doc it should be Wasmer::Instance but
    # look like there is a bug
    @instance = Instance.new(@@bytes)
  end

  def test_initial_memory_size
    p @instance.memory.methods
    assert_equal 1, @instance.exports.memory_size
  end

  def test_get_freep
    assert_equal @instance.exports.get_freep(), 0
  end

  def test_set_freep
    value = 0x12345678
    #p @instance.exports.methods
    @instance.exports.proxy_set_freep(value)
    assert_equal value, @instance.exports.get_freep()
  end

end