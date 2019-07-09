
require 'open-uri'

# load opcodes definition files
LOCAL_FILE  = '/tmp/opcodes.rb'
OPCODES_URL = 'https://raw.githubusercontent.com/rubinius/rubinius-code/master/lib/rubinius/code/compiler/opcodes.rb'

unless File.exist? LOCAL_FILE
  f = open(OPCODES_URL)
  File.open(LOCAL_FILE,'w') do |fh|
    fh.write(f.read)
  end
end


module Rubinius

  Instruction = Struct.new(:id,:name,:stack,:args,:control_flow)

  class InstructionSet
    @@opcodes = []

    def self.opcode(id,name,options = {})
      @@opcodes << Instruction.new(id, name, options[:stack], options[:args], options[:control_flow])
    end

    def self.find_by_name(name)
      @@opcodes.find {|insn| insn.name == name }
    end
  end
end

load '/tmp/opcodes.rb'

# =================================================================


MEMORY_BASE = 64
INSN_TMPL = '(data 0 (i32.const %d) %s) ;; %d'

class Integer
  def to_little_endian(byte_count)
    ("%0#{byte_count*2}X" % self).scan(/../).reverse.map {|byte| "Ox#{byte}"}
  end
end


# Limit the instrctions generation to this subset
names_subset = [:b_if, :goto, :goto_past, :n_iadd, :n_ile, :n_ilt,
  :r_copy, :r_load_1, :r_load_int, :r_load_local , :r_store_int,
  :r_store_stack, :ret]

name_data = []
names_addr = []
instruction_data = []
declaration_data = []
element_data = []

# Generate instruction names data
addr = MEMORY_BASE
names_subset.each do |name|
  names_addr << addr
  name_data << "(data 0 (i32.const #{addr}) \"#{name}\\00\")"
  addr += name.to_s.size + 1
end
puts name_data.join("\n")


# Round addr to the next 4 bytes aligned location
addr = (addr & ~3) + 4

# Generate instruction data name, id, size, args, function index)
names_subset.each_with_index do |name, idx|
  insn = Rubinius::InstructionSet.find_by_name(name)
  name_addr = names_addr[idx]
  id = insn.id
  arg_count = insn.args.size
  size = arg_count + 1
  func_idx = idx

  instruction_data << ";; #{insn.name}"
  [name_addr, size, id, arg_count, func_idx].each do |v|
   instruction_data << sprintf(INSN_TMPL, addr, v.to_little_endian(4), v)
   addr += 4
  end
end

element_data << "(table #{names_subset.size} funcref)"
element_data << '(elem (i32.const 0)'
element_data << names_subset.map {|s| "$#{s}"}.join(', ')
element_data << ')'

puts %q{
;; ========== Rubinius Instruction Set ================'
;;
;; Instructions
;;    -> Instruction names
}
puts name_data.join("\n")
puts %q{
;;
;;     Instruction Set
;;
;; An instruction is made of 5 fields
;;   - Address of instruction name (i32)
;;   - size of the instruction
;;   - opcode id
;;   - number of arguments
;;   - function pointer (actually WASM function index)
;;-------
}
puts instruction_data.join("\n")
puts %q{
;; *** IMPORTANT NOTE ***
;; Functions below must be declared in the exact same order as
;; the Intruction Set above so that function index in the WASM
;; table match the index in the Instuction set array above
}
puts element_data.join("\n")
