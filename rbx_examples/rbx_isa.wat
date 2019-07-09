(module $rbx_wasm
  ;; This is the memory where we store interpreter
  ;; data like 1. The iseq; 2. The activation frame
  ;; For now we store registers 
  (memory 0 1)

  (global $TEXT (const i32) (i32.const 5170))  ;; rbx program opcodes
  (global $HEAP (const i32) (i32.const 10024)) ;; heap base address

  ;; For now we don't have all the interpreter machinery
  ;; implemented to allocate dynamically the call frame
  ;; etc... so let's do it by hand. VERY UGLY but it's a start

  ;; Memory 0 to 64: (16 x 4 bytes for now to store some hardcoded offsets)
  ;; we use 32 bits offset here because wasm memory segment are 2^32 bytes
  ;; max as far as I understand
  ;;
  ;; Offsets below are relative to the Call Frame structure
  (data 0 (i32.const 0)  0x00 0x00 0x00 0x00)  ;; Previous CF offset
  (data 0 (i32.const 4)  0x04 0x00 0x00 0x00)  ;; IP offset (4)
  (data 0 (i32.const 8)  0x0C 0x00 0x00 0x00)  ;; Registers Offset (12)
  (data 0 (i32.const 12) 0x84 0x00 0x00 0x00)  ;; Locals Offset (76)

  ;; %% BEGINNING OF GENERATED INTRUCTION SET DATA %%
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
  ;; b_if r, label
  (data 0 (i32.const 512) 0x40 0x00 0x00 0x00) ;; 64
  (data 0 (i32.const 516) 0x02 0x00 0x00 0x00) ;; 2
  (data 0 (i32.const 520) 0x7e 0x00 0x00 0x00) ;; 126
  (data 0 (i32.const 524) 0x00 0x00 0x00 0x00) ;; 0
  ;; goto label
  (data 0 (i32.const 528) 0x45 0x00 0x00 0x00) ;; 69
  (data 0 (i32.const 532) 0x01 0x00 0x00 0x00) ;; 1
  (data 0 (i32.const 536) 0x11 0x00 0x00 0x00) ;; 17
  (data 0 (i32.const 540) 0x01 0x00 0x00 0x00) ;; 1
  ;; goto_past label
  (data 0 (i32.const 544) 0x45 0x00 0x00 0x00) ;; 74
  (data 0 (i32.const 548) 0x01 0x00 0x00 0x00) ;; 1
  (data 0 (i32.const 552) 0xb5 0x00 0x00 0x00) ;; 181
  (data 0 (i32.const 556) 0x02 0x00 0x00 0x00) ;; 2
  ;; n_iadd r1, r2, r3
  (data 0 (i32.const 560) 0x54 0x00 0x00 0x00) ;; 84
  (data 0 (i32.const 564) 0x03 0x00 0x00 0x00) ;; 3
  (data 0 (i32.const 568) 0x89 0x00 0x00 0x00) ;; 137
  (data 0 (i32.const 572) 0x03 0x00 0x00 0x00) ;; 3  
  ;; n_ile r1, r2, r3
  (data 0 (i32.const 576) 0x5b 0x00 0x00 0x00) ;; 91
  (data 0 (i32.const 580) 0x03 0x00 0x00 0x00) ;; 3
  (data 0 (i32.const 584) 0x94 0x00 0x00 0x00) ;; 148
  (data 0 (i32.const 588) 0x04 0x00 0x00 0x00) ;; 4  
  ;; n_ilt r1, r2, r3
  (data 0 (i32.const 592) 0x61 0x00 0x00 0x00) ;; 97
  (data 0 (i32.const 596) 0x03 0x00 0x00 0x00) ;; 3
  (data 0 (i32.const 600) 0x93 0x00 0x00 0x00) ;; 147
  (data 0 (i32.const 604) 0x05 0x00 0x00 0x00) ;; 5
  ;; r_copy r1, r2
  (data 0 (i32.const 608) 0x67 0x00 0x00 0x00) ;; 103
  (data 0 (i32.const 612) 0x02 0x00 0x00 0x00) ;; 2
  (data 0 (i32.const 616) 0x88 0x00 0x00 0x00) ;; 136
  (data 0 (i32.const 620) 0x06 0x00 0x00 0x00) ;; 6 
  ;; r_load_1 r1
  (data 0 (i32.const 624) 0x6e 0x00 0x00 0x00) ;; 110
  (data 0 (i32.const 628) 0x01 0x00 0x00 0x00) ;; 1
  (data 0 (i32.const 632) 0xb8 0x00 0x00 0x00) ;; 184
  (data 0 (i32.const 636) 0x07 0x00 0x00 0x00) ;; 7 
  ;; r_load_int r1, r2
  (data 0 (i32.const 640) 0x77 0x00 0x00 0x00) ;; 119
  (data 0 (i32.const 644) 0x02 0x00 0x00 0x00) ;; 2
  (data 0 (i32.const 648) 0x86 0x00 0x00 0x00) ;; 134
  (data 0 (i32.const 652) 0x08 0x00 0x00 0x00) ;; 8
  ;; r_load_local r1, ip
  (data 0 (i32.const 656) 0x82 0x00 0x00 0x00) ;; 130
  (data 0 (i32.const 660) 0x02 0x00 0x00 0x00) ;; 2
  (data 0 (i32.const 664) 0x7f 0x00 0x00 0x00) ;; 127
  (data 0 (i32.const 668) 0x09 0x00 0x00 0x00) ;; 9
  ;; r_store_int r1, r2
  (data 0 (i32.const 672) 0x8f 0x00 0x00 0x00) ;; 143
  (data 0 (i32.const 676) 0x02 0x00 0x00 0x00) ;; 2
  (data 0 (i32.const 680) 0x87 0x00 0x00 0x00) ;; 135
  (data 0 (i32.const 684) 0x0a 0x00 0x00 0x00) ;; 10  
  ;; r_store_stack r
  (data 0 (i32.const 688) 0x9b 0x00 0x00 0x00) ;; 155
  (data 0 (i32.const 692) 0x01 0x00 0x00 0x00) ;; 1
  (data 0 (i32.const 696) 0x84 0x00 0x00 0x00) ;; 132
  (data 0 (i32.const 700) 0x0a 0x00 0x00 0x00) ;; 11  
  ;; ret
  (data 0 (i32.const 704) 0xa9 0x00 0x00 0x00) ;; 169
  (data 0 (i32.const 708) 0x00 0x00 0x00 0x00) ;; 0
  (data 0 (i32.const 712) 0x46 0x00 0x00 0x00) ;; 70
  (data 0 (i32.const 716) 0x0b 0x00 0x00 0x00) ;; 12    
  
    ;; %% END OF GENERATED INTRUCTION SET DATA %%

  ;; Rbx program opcodes loading
  ;; for now it's implemented by hand
  (data 0 (i32 const 5170) )

  ;; This is where heap base starts
  ;; Memory 10024 and beyond
  ;;
  ;; Call Frames are **HARCODED FOR NOW** (TODO: make it dynamic)
  ;; Call Frame 0 (IP + 8 registers + 8 locals)
  (data 0 (i32.const 10024) "\00\00\00\00") ;; Previous CF address (0x00000000 means bottom CF)
  (data 0 (i32.const 10028) "\00\00\00\00\00\00\00\00") ;; IP
  ;;
  (data 0 (i32.const 10036) "\00\00\00\00\00\00\00\00") ;; R0 = 0
  (data 0 (i32.const 10044) "\00\00\00\00\00\00\00\00") ;; R1 = 0
  (data 0 (i32.const 10052) "\00\00\00\00\00\00\00\00") ;; R2 = 0
  (data 0 (i32.const 10060) "\00\00\00\00\00\00\00\00") ;; R3 = 0
  (data 0 (i32.const 10068) "\00\00\00\00\00\00\00\00") ;; R4 = 0
  (data 0 (i32.const 10076) "\00\00\00\00\00\00\00\00") ;; R5 = 0
  (data 0 (i32.const 10084) "\00\00\00\00\00\00\00\00") ;; R6 = 0
  (data 0 (i32.const 10092) "\00\00\00\00\00\00\00\00") ;; R7 = 0
  ;;
  (data 0 (i32.const 10100) "\00\00\00\00\00\00\00\00") ;; Local0 = 0
  (data 0 (i32.const 10108) "\00\00\00\00\00\00\00\00") ;; Local1 = 0
  (data 0 (i32.const 10116) "\00\00\00\00\00\00\00\00") ;; Local2 = 0
  (data 0 (i32.const 10124) "\00\00\00\00\00\00\00\00") ;; Local3 = 0
  (data 0 (i32.const 10132) "\00\00\00\00\00\00\00\00") ;; Local4 = 0
  (data 0 (i32.const 10140) "\00\00\00\00\00\00\00\00") ;; Local5 = 0
  (data 0 (i32.const 10148) "\00\00\00\00\00\00\00\00") ;; Local6 = 0
  (data 0 (i32.const 10156) "\00\00\00\00\00\00\00\00") ;; Local7 = 0

  ;; module execution entry point
  (start $main)

  ;; ===================================================
  ;; Instruction functions
  ;;
  ;; $cf and $r? parameters are i32 because they are passed as 
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
  ;; Functions below must be declared in the exact same order as
  ;; the Intruction Set above so that function index in the WASM
  ;; table match the index in the Instuction set array above
  (elem (i32.const 0) 
    $b_if $goto $goto_past $n_iadd $n_ile $n_ilt
    $r_copy $r_load_1 $r_load_int $r_load_local
    $r_store_int $r_store_stack $ret
  )


  ;; ===================================================
  ;; Call Frame access functions
  ;;

  ;; >> Register access functions

  ;; compute reg address
  (func $reg_addr (param $cf i32) (param $r i32) (result i32)
    local.get $cf
    i32.const 8 ;; register offset memory address
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

  ;; >> Locals access function

  ;; get rbx local addr
  (func $local_addr (param $cf i32) (param $l i32) (result i32)
    local.get $cf
    i32.const 12 ;; label offset memory address
    i32.load
    i32.add
    local.get $l
    i32.const 8
    i32.mul
    i32.add
  )

  (func $local_get (param $cf i32) (param $l i32) (result i64)
    ;; compute local address
    local.get $cf
    local.get $l
    call $local_addr
    ;; load from local location
    i64.load
  )

  ;; >> IP function

  (func $ip_addr (param $cf i32) (result i32)
    local.get $cf
    i32.const 4 ;; ip offset memory address
    i32.load
    i32.add
  )

  ;; set ip value
  (func $ip_set (param $cf i32) (param $val i64)
    ;; compute ip address
    local.get $cf
    call $ip_addr
    ;; push value
    local.get $val
    ;; store in ip location
    i64.store
  )

  ;; get reg value (= push it on stack)
  (func $ip_get (param $cf i32) (result i64)
    ;; compute memory-operand (register value x 8 bytes)
    local.get $cf
    call $ip_addr
    ;; load from register location
    i64.load
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