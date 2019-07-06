(module $rbx_wasm
  ;; This is the memory where we store interpreter
  ;; data like 1. The iseq; 2. The activation frame
  ;; For now we store registers 
  (memory 0 1)

  (global $HB (const i32) (i32.const 1024)) ;; heap base address

  ;; For now we don't have all the interpreter machinery
  ;; implemented to allocate dynamically the call frame
  ;; etc... so let's do it by hand. VERY UGLY but it's a start

  ;; Memory 0 to 64: (16 x 4 bytes for now to store some hardcoded offsets)
  ;; we use 32 bits offset here because wasm memory segment are 2^32 bytes
  ;; max as far as I understand
  ;;
  ;; Offsets below are relative to the Call Frame structure
  (data 0 (i32.const 0)  0x00 0x00 0x00 0x00)  ;; Previous CF offset
  (data 0 (i32.const 4)  0x00 0x00 0x00 0x00)  ;; IP offset (0)
  (data 0 (i32.const 8)  0x08 0x00 0x00 0x00)  ;; Registers Offset (8)
  (data 0 (i32.const 12) 0x0B 0x00 0x00 0x00)  ;; Locals Offset (72)

  ;;...some free space
  ;; Instructions
  ;;    > Instruction names
  (data 0 (i32.const 64) "b_if\00") 
  (data 0 (i32.const 69) "goto\00") 
  (data 0 (i32.const 74) "goto_past\00") 
  (data 0 (i32.const 84) "n_iadd\00") 
  (data 0 (i32.const 91) "n_ile\00") 
  (data 0 (i32.const 97) "n_ilt\00") 
  (data 0 (i32.const 103) "r_copy\00") 
  (data 0 (i32.const 110) "r_load_1\00") 
  (data 0 (i32.const 119) "r_load_int\00") 
  (data 0 (i32.const 130) "r_load_local\00") 
  (data 0 (i32.const 143) "r_store_int\00") 
  (data 0 (i32.const 155) "r_store_stack\00") 
  (data 0 (i32.const 169) "ret\00") 
  ;;...
  ;;     Instruction Set
  ;;
  ;; An instruction is made of 5 fields
  ;;   - Address of instruction name (i32)
  ;;   - size (= number of arguments) (i16)
  ;;   - opcode (= instruction unique code) (i16)
  ;;   - index in table function (i32)
  ;;-------
  ;; b_if
  (data 0 (i32.const 512) 0x40 0x00 0x00 0x00) ;; 64
  (data 0 (i32.const 516) 0x01 0x00 0x00 0x00) ;; 2
  (data 0 (i32.const 520) 0x7e 0x00 0x00 0x00) ;; 126
  (data 0 (i32.const 524) 0x00 0x00 0x00 0x00) ;; 0


  ;; This is where heap base starts
  ;; Memory 1024 and beyond
  ;;
  ;; Call Frames are **HARCODED FOR NOW** (TODO: make it dynamic)
  ;; Call Frame 0 (IP + 8 registers + 8 locals)
  (data 0 (i32.const 1024) "\00\00\00\00") ;; Previous CF offset (0x00000000 means bottom CF)
  (data 0 (i32.const 1032) "\00\00\00\00\00\00\00\00") ;; IP
  ;;
  (data 0 (i32.const 1040) "\00\00\00\00\00\00\00\00") ;; R0 = 0
  (data 0 (i32.const 1048) "\00\00\00\00\00\00\00\00") ;; R1 = 0
  (data 0 (i32.const 1056) "\00\00\00\00\00\00\00\00") ;; R2 = 0
  (data 0 (i32.const 1064) "\00\00\00\00\00\00\00\00") ;; R3 = 0
  (data 0 (i32.const 1072) "\00\00\00\00\00\00\00\00") ;; R4 = 0
  (data 0 (i32.const 1080) "\00\00\00\00\00\00\00\00") ;; R5 = 0
  (data 0 (i32.const 1088) "\00\00\00\00\00\00\00\00") ;; R6 = 0
  (data 0 (i32.const 1096) "\00\00\00\00\00\00\00\00") ;; R7 = 0
  ;;
  (data 0 (i32.const 1104) "\00\00\00\00\00\00\00\00") ;; Local0 = 0
  (data 0 (i32.const 1112) "\00\00\00\00\00\00\00\00") ;; Local1 = 0
  (data 0 (i32.const 1120) "\00\00\00\00\00\00\00\00") ;; Local2 = 0
  (data 0 (i32.const 1128) "\00\00\00\00\00\00\00\00") ;; Local3 = 0
  (data 0 (i32.const 1136) "\00\00\00\00\00\00\00\00") ;; Local4 = 0
  (data 0 (i32.const 1144) "\00\00\00\00\00\00\00\00") ;; Local5 = 0
  (data 0 (i32.const 1152) "\00\00\00\00\00\00\00\00") ;; Local6 = 0
  (data 0 (i32.const 1160) "\00\00\00\00\00\00\00\00") ;; Local7 = 0

  ;; Offset 128...256 (rbx locals for now)
  ;; then come the rbx locals (aaarghhh... it's the ugliest
  ;; and most hardcoded stackframe you can think of)
  (data 0 (i32.const 128) "\00\00\00\00\00\00\00\00") ;; Local 0
  (data 0 (i32.const 104) "\00\00\00\00\00\00\00\00") ;; Local 1

  ;; Offset 256...512 (rbx stack for now)
  ;; then come the rbx stack (aaarghhh... it's the ugliest
  (data 0 (i32.const 256) "\00\00\00\00\00\00\00\00") ;; slot 0
  (data 0 (i32.const 264) "\00\00\00\00\00\00\00\00") ;; slot 1


  ;; module execution entry point
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

  ;; ===================================================
  ;; Instruction functions
  ;;
  ;; $cf and $r? parameters ar i32 because they are passed as 
  ;;  indices (eg. 1st call frame is 0, r0 is 0, r1 is 1,...)
  ;; $1, $2 params are 64 bits because they are Ruby values
  ;; (TODO: does this make sense ??)
  (table 13 funcref)
  (func $b_if (param $cf i32) (param $r i32) (param $lbl i32)
  )
  (func $goto (param $cf i32) (param $lbl i32)
  )
  (func $goto_past (param $cf i32) (param $lbl i32)
  )
  (func $n_iadd (param $cf i32) (param $r1 i32) (param $r2 i32) (param $r3 i32)
  )
  (func $n_ile (param $cf i32) (param $r1 i32) (param $r2 i32) (param $r3 i32)
  )
  (func $n_ilt (param $cf i32) (param $r1 i32) (param $r2 i32) (param $r3 i32)
  )
  (func $r_copy (param $cf i32) (param $r1 i32) (param $r2 i32)
  )
  (func $r_load_1 (param $cf i32) (param $r1 i32)
  )      
  (func $r_load_int (param $cf i32) (param $r1 i32) (param $r2 i32)
  )
  (func $r_load_local (param $cf 32) (param $r i32) (param $1 i64)
  )
  (func $r_store_int (param $cf 32) (param $r i32) (param $r2 i32)
  )
  (func $r_store_stack (param $cf 32) (param $r i32)
  )
  (func $ret (param $cf 32)
  )

  ;; *** IMPORTANT NOTE ***
  ;; Functions below must be declared int he exact same order as
  ;; the Intruction Set above so that function index in the WASM
  ;; table match the index in the Instuction set array above
  (elem (i32.const 0) 
    $b_if $goto $goto_past $n_iadd $n_ile $n_ilt
    $r_copy $r_load_1 $r_load_int $r_load_local
    $r_store_int $r_store_stack $ret
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