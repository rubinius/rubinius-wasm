class Interpreter
  
  def run(arg)

    # Instantiate a new stack
    stk = Stack.init

    # set initial call frame structure
    cf = CallFrame.init

    # initialize opcodes address (this is where rbx
    # application bytecode is located)
    opcodes = Global[:$OPCODES]
  
    # initialize address to instructions definition
    state = Global[:$INSTRUCTIONS]
  
    # initialize IP to first instruction (ip = 0)
    CallFrame.ip(cf) = 0
  
      # initialize local 0 in call frame with Fibonacci value n
      # TODO: This is hardcoded for now - must implement calling a rbx
      # function with args
      CallFrame.local_set(cf, 0, arg)
  
      loop do
        # fetch opcode id at current ip
        # That's the instruction to execute
        opcode = CallFrame.opcode(cf)

        # call insn function indirectly
        # TODO (call $log_cf (local.get $cf)) # DEBUG msg
        inline
          wasm: %q{ (call_indirect (type $insn_t) 
            (local.get $state) 
            (local.get $cf) 
            (local.get $opcodes) 
            (local.get $opcode) # instruction function pointer
          )
        },
          ruby: %q{ call_indirect(state, cf, opcodes, opcode)
          }
          
          # stop interpreting if opocde is 'ret'
          # TODO: must refine halt condition
          break if opcode == 70
      end

      return Memory.load(CallFrame.stack_top(cf), Type::I64))
      
  end
end