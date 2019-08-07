   ;; ===================================================
  ;; Call Frame access functions
  ;; ===================================================

  ;; -----------------------------------------------
  ;; >>>>>>>    Register access functions

  ;; compute reg address
  (func $reg_addr (param $cf i32) (param $r i32) (result i32)
    local.get $cf
    i32.const 12 ;; register offset memory address
    i32.load
    i32.add
    local.get $r
    i32.const 8 ;; registers are 8 bytes long
    i32.mul
    i32.add
  )

  ;; set reg value
  (func $reg_set (param $cf i32) (param $r i32) (param $val i64)
    ;; compute memory-operand (register value x 8 bytes)
    local.get $cf
    local.get $r
    call $reg_addr
    ;; push value
    local.get $val
    ;; store in register location
    i64.store
  )

  ;; get reg value (= push it on stack)
  (func $reg_get (param $cf i32) (param $r i32) (result i64)
    ;; compute memory-operand (register value x 8 bytes)
    local.get $cf
    local.get $r
    call $reg_addr
    ;; load from register location
    i64.load
  )

  ;; -----------------------------------------------
  ;; >>>>>>>   Locals access function

  ;; get rbx local addr
  (func $local_addr (param $cf i32) (param $l i32) (result i32)
    local.get $cf
    i32.const 16 ;; label offset memory address
    i32.load
    i32.add
    local.get $l
    i32.const 8
    i32.mul
    i32.add
  )

  ;; set local value
  (func $local_set (param $cf i32) (param $l i32) (param $val i64)
    ;; compute memory-operand (register value x 8 bytes)
    local.get $cf
    local.get $l
    call $local_addr
    ;; push value
    local.get $val
    ;; store in register location
    i64.store
  )

  (func $local_get (param $cf i32) (param $l i32) (result i64)
    ;; compute local address
    local.get $cf
    local.get $l
    call $local_addr
    ;; load from local location
    i64.load
  )

  ;; -----------------------------------------------
  ;; >>>>>>>   IP function
  ;; Note: IP value is not a absolute address in WASM memory
  ;; but an offset relative to the beginning of the current 
  ;; rbx bytecode section being executed

  ;; Address of current ip field in WASM memory
  (func $ip_addr (param $cf i32) (result i32)
    local.get $cf
    i32.const 4 
    i32.add
  )

  ;; set current ip value
  ;; ip = val
  (func $ip_set (param $cf i32) (param $val i32)
    ;; compute ip address
    local.get $cf
    call $ip_addr
    ;; push value
    local.get $val
    ;; store in ip location
    i32.store
  )

  ;; get current ip value (= push it on stack)
  (func $ip_get (param $cf i32) (result i32)
    ;; compute the address of IP in current call frame
    local.get $cf
    call $ip_addr
    ;; load IP value
    i32.load
  )

  ;; increment ip value
  ;; ip = ip + val
  (func $ip_incr (param $cf i32) (param $val i32)
    (call $ip_set
      (local.get $cf)
      (i32.add
        (call $ip_get (local.get $cf)) ;; get current ip
        (local.get $val)  ;; add val
      )
    )
  )

  ;; set ip value to next insn
  ;; ip = ip + current insn.size
  (func $ip_next (param $cf i32)
    ;; increase IP by current instruction size
    (call $ip_set
      (local.get $cf)
      (i32.add
        (call $ip_get (local.get $cf)) ;; get current ip
        (call $insn_size (call $ip_get_opcode (local.get $cf)))  ;; add width
      )
    )
  )

  ;; get bytecode value at ip+offset
  ;; (this is to read opcodes and argument values from byte code)
  ;; offset 0 = opcode
  ;;        1 = first argument
  ;;        2 = second argument
  ;;        ....
  (func $ip_get_bytecode (param $cf i32) (param $offset i32) (result i32)
    ;; TODO : WARNING text is taken as the base address to
    ;; compute the bytecode address in WASM memory but
    ;; this only works bcause we have a single function right now
    (i32.load 
      (i32.add 
        (global.get $OPCODES)
        ;; get ip location, add offset and x4 to get WASM memory address
        (i32.mul
          (i32.add
            (call $ip_get (local.get $cf))
            (local.get $offset)
          )
          (i32.const 4)
        )
      )
    )
  )

  ;; get opcode at IP
  (func $ip_get_opcode (param $cf i32) (result i32)
    (call $ip_get_bytecode (local.get $cf) (i32.const 0))
  )

  ;; get argument n at IP
  (func $ip_get_arg (param $cf i32) (param $n i32) (result i32)
    (call $ip_get_bytecode (local.get $cf) (local.get $n))
  )

  ;; get argument 1 (convenience func)
  (func $ip_get_arg_1 (param $cf i32) (result i32)
    (call $ip_get_arg (local.get $cf) (i32.const 1))
  )

  ;; get argument 2 (convenience func)
  (func $ip_get_arg_2 (param $cf i32) (result i32)
    (call $ip_get_arg (local.get $cf) (i32.const 2))
  )

  ;; get argument 3 (convenience func)
  (func $ip_get_arg_3 (param $cf i32) (result i32)
    (call $ip_get_arg (local.get $cf) (i32.const 3))
  )


  ;; -----------------------------------------------
  ;; >>>>>>>  Stack functions

  (func $stack_addr (param $cf i32) (result i32)
    (i32.add
      (local.get $cf)
      (i32.const 8) ;; stack offset in call frame
    )
  )

  (func $stack_ptr_get (param $cf i32) (result i32)
    (i32.load (call $stack_addr (local.get $cf)))
  )

  (func $stack_ptr_set (param $cf i32) (param $address i32)
    (i32.store
      (call $stack_addr (local.get $cf))
      (local.get $address)
    )
  )

  (func $stack_ptr_incr (param $cf i32)
    (call $stack_ptr_set
      (local.get $cf)
      (i32.add 
        (call $stack_ptr_get (local.get $cf))
        (i32.const 8) ;; All objects ptr on stack are 8 bytes long
      )
    )
  )

  (func $stack_push (param $cf i32) (param $value i64)
    (call $stack_ptr_incr (local.get $cf))
    (i64.store
      (call $stack_ptr_get (local.get $cf))
      (local.get $value)
    )
  )

  (func $stack_top (param $cf i32) (result i32)
    (call $stack_ptr_get (local.get $cf))
  )
