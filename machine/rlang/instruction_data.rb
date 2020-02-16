class InstructionData
  
  # TODO replace the below accessor methods with those 2 lines
  #attr_name :name, :size, :id, :arg_count, :func_idx
  #attr_type name: I32, size: I32, id: I32, arg_count: I32, func_idx: I32

  #def initialize(opcode)
  #  @opcode = opcode
  #  self.ptr
  #end

  def self.ptr(opcode)
    Data[:insn_data] + 20 * opcode
  end

  def self.name(opcode)
    Memory[self.ptr(opcode)]
  end

  def self.size(opcode)
    Memory[self.ptr(opcode) + 4]
  end

  def self.id(opcode)
    Memory[self.ptr(opcode) + 8]
  end

  def self.arg_count(opcode)
    Memory[self.ptr(opcode) + 12]
  end

  def self.func_idx(opcode)
    Memory[self.ptr(opcode) + 16]
  end 
end

=begin

size = InstructionData.size(opcode)


(local.set $size
  (call $InstructionData::size (local.get $opcode))
)



=end