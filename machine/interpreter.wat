
  ;; NOTE : this is a nasty hardcoded interpreter for fib
  ;; Of course this must become a true interpreter !!!
  ;; But let's make baby steps
  ;;
  ;; $0 is passed as an argument to the rbx application
  (func $interpret (param $0 i64) (result i64)
    (local $cf i32)
    (local $state i32)
    (local $opcodes i32)

    (local $opcode i32)

    ;; set initial call frame address (= HEAP base addr)
    (local.set $cf (global.get $HEAP))
    
    ;; initialize opcodes address (this is where rbx
    ;; application bytecode is located)
    (local.set $opcodes (global.get $OPCODES))

    ;; initialize addresse to instructions definition
    (local.set $state (global.get $INSTRUCTIONS))

    ;; initialize IP to first instruction (ip = 0)
    (call $ip_set
      (local.get $cf)
      (i32.const 0)
    )

    ;; initialize local 0 in call frame with Fibonacci value n
    ;; TODO: This is hardcoded for now - must implement calling a rbx
    ;; function with args
    (call $local_set
      (local.get $cf) ;; bottom call frame pointer ($cf)
      (i32.const 0) ;; local 0
      (local.get $0) ;; value
    )

    block $interp_block
      loop $insn_loop
        ;; fetch opcode id at current ip
        (local.set $opcode 
          (call $ip_get_opcode (local.get $cf))
        )
        
        ;; call insn function indirectly
        (call $log_cf (local.get $cf)) ;; DEBUG msg
        (call_indirect (type $insn_t) 
          (local.get $state) 
          (local.get $cf) 
          (local.get $opcodes) 
          (local.get $opcode) ;; instruction function pointer
        )

        ;; stop interpreting if opocde is 'ret'
        ;; TODO: must refine halt condition
        (if
          (i32.eq (local.get $opcode) (i32.const 70))
          (then (br $interp_block))
          (else (br $insn_loop))
        )
      end
    end
    
    ;; return value from top of rbx stack
    ;; (note: the pointer to top of the stack pointer in
    ;; WASM memory has already been pushed on the WASM
    ;; stack by the last rbx 'ret' instruction but for now
    ;; the $insn_t type doesn't allo a return value so it 
    ;; simply discarded :-(
    ;; TODO: probably need to refine that in the future
    (i64.load (call $stack_top (local.get $cf)))
  )


  ;; -----------------------------------------------
  ;; >>>>>>>   Instructions attribute access function

  ;; insn opcode address in memory
  (func $insn_ptr (param $opcode i32) (result i32)
    ;; compute opcode offset (= id * 20 bytes)
    local.get $opcode
    i32.const 20 ;; size in bytes of insn 
    i32.mul
    ;; add to opcode attribute array base address
    global.get $INSTRUCTIONS
    i32.add
  )

  ;; opcode name
  (func $insn_name (param $opcode i32) (result i32)
    local.get $opcode
    call $insn_ptr
  )

  ;; insn size in memory
  (func $insn_size (param $opcode i32) (result i32)
    local.get $opcode
    call $insn_ptr
    i32.const 4
    i32.add
    i32.load
  )

  ;; insn opcode id 
  (func $insn_id (param $opcode i32) (result i32)
    ;; TODO Sanity check : make param id == id from the opcode id attribute
    local.get $opcode
    call $insn_ptr
    i32.const 8
    i32.add
    i32.load
  ) 

  ;; insn number of arguments
  (func $insn_arg_count (param $opcode i32) (result i32)
    local.get $opcode
    call $insn_ptr
    i32.const 12
    i32.add
    i32.load
  )

  ;; insn function index
  (func $insn_func (param $opcode i32) (result i32)
    local.get $opcode
    call $insn_ptr
    i32.const 16
    i32.add
    i32.load
  )
