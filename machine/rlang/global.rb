## Global variables section

# memory implant addresses
Global.new(:$INSTRUCTIONS, DAta[:insn_data]) # instructions definition
Global.new(:$OPCODES, 8192)      # rbx bytecode application program

# heap base address (make sure it's aligned on 
# an address compatible with the most restrictive data type
# used in WASM. It's i64, so make this address is a multiple of 8
# The Stack grows downwards in memory
# TODO : the heap base address should be defined at runtine once
# the Ruby bytecode and data is loaded in memory
Global.new(:$HEAP_BASE_ADDR, 10024)

# stack base address (make sure it's aligned on 
# an address compatible with the most restrictive data type
# used in WASM. It's i64, so make this address is a multiple of 8)
# The Stack grows downwards in memory
Global.new(:$STACK_BASE_ADDR, Memory::MAX_SIZE)

# debug flag (1=true, 0=false)
Global.new(:$DEBUG, 0) 

# size of memory chunks allocated at once by malloc::morecore
# (in number of units)
Global.new(:$NALLOC, 1024) 
