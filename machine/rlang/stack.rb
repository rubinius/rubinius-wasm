# The Ruby WASM stack is located
# at the top of the WASM memory and
# grows downwards
 
class Stack

  def self.init
    # For now we manage only one stack 
    # TODO: for thread support we'll have to allocate
    # one stack per thread
    @@stack_ptr = Global[:STACK_BASE_ADDR]
  end

  def self.ptr
    @@stack_ptr
  end

  def self.allocate(nbytes)
    @@stack_ptr -= nbytes
  end

  def self.free(nbytes)
    @@stack_ptr = @@stack_ptr + nbytes
  end

  def self.ptr=(address)
    @@stack_ptr = address
  end

  def self.ptr_incr
    # All Ruby object on stack are 8 bytes long
    @@stack_ptr -= I64.size
  end

  def self.push(value=2)
    local :value, :I64
    self.ptr_incr
    Memory[@@stack_ptr] = value
  end

  def self.top
    @@stack_ptr
  end

end