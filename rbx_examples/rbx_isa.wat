(module $rbx_wasm
  ;; This is the memory where we store interpreter
  ;; data like 1. The iseq; 2. The activation frame
  ;; For now we store registers 
  (memory 0 1)

  (global $HB (const i32) (i32.const 256)) ;; heap base address

  ;; For now we don't have all the interpreter machinery
  ;; implemented to allocate dynamically the allocation frame
  ;; etc... so let's do it by hand. VERY UGLY but it's a start

  ;; Offset 0 to 32 (8 x 4 bytes for now to store some hardcoded offsets)
  ;; we use 32 bits offset here because wasm memory segment are 2^32 bytes
  ;; max as far as I understand
  (data 0 (i32.const 0)  0x20 0x00 0x00 0x00) ;; rbx Reg Offset (32)
  (data 0 (i32.const 4)  0x60 0x00 0x00 0x00) ;; rbx StackFrame Offset (96)
  (data 0 (i32.const 8)  0x00 0x01 0x00 0x00) ;; rbx StackFrame Offset (256)


  ;; Offets 32...96 (8 x 64 bits = 16 registers for now)
  (data 0 (i32.const 32) "\00\00\00\00\00\00\00\00") ;; R0 = 0
  (data 0 (i32.const 40) "\00\00\00\00\00\00\00\00") ;; R1 = 0
  (data 0 (i32.const 48) "\00\00\00\00\00\00\00\00") ;; R2 = 0
  (data 0 (i32.const 56) "\00\00\00\00\00\00\00\00") ;; R3 = 0
  (data 0 (i32.const 32) "\00\00\00\00\00\00\00\00") ;; R4 = 0
  (data 0 (i32.const 40) "\00\00\00\00\00\00\00\00") ;; R5 = 0
  (data 0 (i32.const 48) "\00\00\00\00\00\00\00\00") ;; R6 = 0
  (data 0 (i32.const 56) "\00\00\00\00\00\00\00\00") ;; R7 = 0
  ;;.....
 
  ;; Offset 96...256 (rbx locals for now)
  ;; then come the rbx locals (aaarghhh... it's the ugliest
  ;; and most hardcoded stackframe you can think of)
  (data 0 (i32.const 96) "\00\00\00\00\00\00\00\00") ;; Local 0
  (data 0 (i32.const 104) "\00\00\00\00\00\00\00\00") ;; Local 1

  ;; Offset 256...512 (rbx stack for now)
  ;; then come the rbx stack (aaarghhh... it's the ugliest
  (data 0 (i32.const 256) "\00\00\00\00\00\00\00\00") ;; slot 0
  (data 0 (i32.const 264) "\00\00\00\00\00\00\00\00") ;; slot 1


  ;; execution entry point
  (start $main)

  ;; ===================================================
  ;; Register access functions

  ;; compute reg address
  (func $reg_addr (param $r i32) (result i32)
    local.get $r
    i32.const 8
    i32.mul
    i32.const 0 ;; register offset memory address
    i32.load
    i32.add
  )

  ;; set reg value
  (func $reg_set (param $r i32) (param $val i64)
    ;; compute memory-operand (register value x 8 bytes)
    local.get $r
    call $reg_addr
    ;; push value
    local.get $val
    ;; store in register location
    i64.store
  )

  ;; get reg value (= push it on stack)
  (func $reg_get (param $r i32) (result i64)
    ;; compute memory-operand (register value x 8 bytes)
    local.get $r
    call $reg_addr
    ;; load from register location
    i64.load
  )

  ;; ===================================================
  ;; Stack access function

  ;; get rbx local addr
  (func $local_addr (param $l i32) (result i32)
    local.get $l
    i32.const 8
    i32.mul
    i32.const 4 ;; label offset memory address
    i32.load
    i32.add
  )

  (func $local_get (param $l i32) (result i64)
    ;; compute memory-operand (register value x 8 bytes)
    local.get $l
    call $reg_addr
    ;; load from register location
    i64.load
  )

  ;;
  (func $r_load_local (param $r i64) (param $1 i64)


  )

  (func $required_args (param $r i64) (param $1 i64)


  )

  ;; NOTE : this is a nasty hard coded interpreter for fib
  ;; Of course this must become a true interpreter !!!
  ;; But let's make baby steps
  (func $dynamic_method (param $0 i64) (result i64)

    i64.const 1
    call $required_args
    i64.const 1
    call $total_args
    i64.const 1
    call $local_count    
    local.get $0

  
  )

  ;; Invoke the fib method
  ;; fib(5)
  (func $main (result i64)
    i64.const 5
    call $dynamic_method
  )

)