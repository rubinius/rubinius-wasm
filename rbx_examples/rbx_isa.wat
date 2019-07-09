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
 
;; ========== Rubinius Instruction Set ================'
;;
;; Instructions
;;    -> Instruction names
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
;; b_if
(data 0 (i32.const 176) 0x40 0x00 0x00 0x00) ;; 64
(data 0 (i32.const 180) 0x03 0x00 0x00 0x00) ;; 3
(data 0 (i32.const 184) 0x7E 0x00 0x00 0x00) ;; 126
(data 0 (i32.const 188) 0x02 0x00 0x00 0x00) ;; 2
(data 0 (i32.const 192) 0x00 0x00 0x00 0x00) ;; 0
;; goto
(data 0 (i32.const 196) 0x45 0x00 0x00 0x00) ;; 69
(data 0 (i32.const 200) 0x02 0x00 0x00 0x00) ;; 2
(data 0 (i32.const 204) 0x11 0x00 0x00 0x00) ;; 17
(data 0 (i32.const 208) 0x01 0x00 0x00 0x00) ;; 1
(data 0 (i32.const 212) 0x01 0x00 0x00 0x00) ;; 1
;; goto_past
(data 0 (i32.const 216) 0x4A 0x00 0x00 0x00) ;; 74
(data 0 (i32.const 220) 0x02 0x00 0x00 0x00) ;; 2
(data 0 (i32.const 224) 0xB5 0x00 0x00 0x00) ;; 181
(data 0 (i32.const 228) 0x01 0x00 0x00 0x00) ;; 1
(data 0 (i32.const 232) 0x02 0x00 0x00 0x00) ;; 2
;; n_iadd
(data 0 (i32.const 236) 0x54 0x00 0x00 0x00) ;; 84
(data 0 (i32.const 240) 0x04 0x00 0x00 0x00) ;; 4
(data 0 (i32.const 244) 0x89 0x00 0x00 0x00) ;; 137
(data 0 (i32.const 248) 0x03 0x00 0x00 0x00) ;; 3
(data 0 (i32.const 252) 0x03 0x00 0x00 0x00) ;; 3
;; n_ile
(data 0 (i32.const 256) 0x5B 0x00 0x00 0x00) ;; 91
(data 0 (i32.const 260) 0x04 0x00 0x00 0x00) ;; 4
(data 0 (i32.const 264) 0x94 0x00 0x00 0x00) ;; 148
(data 0 (i32.const 268) 0x03 0x00 0x00 0x00) ;; 3
(data 0 (i32.const 272) 0x04 0x00 0x00 0x00) ;; 4
;; n_ilt
(data 0 (i32.const 276) 0x61 0x00 0x00 0x00) ;; 97
(data 0 (i32.const 280) 0x04 0x00 0x00 0x00) ;; 4
(data 0 (i32.const 284) 0x93 0x00 0x00 0x00) ;; 147
(data 0 (i32.const 288) 0x03 0x00 0x00 0x00) ;; 3
(data 0 (i32.const 292) 0x05 0x00 0x00 0x00) ;; 5
;; r_copy
(data 0 (i32.const 296) 0x67 0x00 0x00 0x00) ;; 103
(data 0 (i32.const 300) 0x03 0x00 0x00 0x00) ;; 3
(data 0 (i32.const 304) 0x88 0x00 0x00 0x00) ;; 136
(data 0 (i32.const 308) 0x02 0x00 0x00 0x00) ;; 2
(data 0 (i32.const 312) 0x06 0x00 0x00 0x00) ;; 6
;; r_load_1
(data 0 (i32.const 316) 0x6E 0x00 0x00 0x00) ;; 110
(data 0 (i32.const 320) 0x02 0x00 0x00 0x00) ;; 2
(data 0 (i32.const 324) 0xB8 0x00 0x00 0x00) ;; 184
(data 0 (i32.const 328) 0x01 0x00 0x00 0x00) ;; 1
(data 0 (i32.const 332) 0x07 0x00 0x00 0x00) ;; 7
;; r_load_int
(data 0 (i32.const 336) 0x77 0x00 0x00 0x00) ;; 119
(data 0 (i32.const 340) 0x03 0x00 0x00 0x00) ;; 3
(data 0 (i32.const 344) 0x86 0x00 0x00 0x00) ;; 134
(data 0 (i32.const 348) 0x02 0x00 0x00 0x00) ;; 2
(data 0 (i32.const 352) 0x08 0x00 0x00 0x00) ;; 8
;; r_load_local
(data 0 (i32.const 356) 0x82 0x00 0x00 0x00) ;; 130
(data 0 (i32.const 360) 0x03 0x00 0x00 0x00) ;; 3
(data 0 (i32.const 364) 0x7F 0x00 0x00 0x00) ;; 127
(data 0 (i32.const 368) 0x02 0x00 0x00 0x00) ;; 2
(data 0 (i32.const 372) 0x09 0x00 0x00 0x00) ;; 9
;; r_store_int
(data 0 (i32.const 376) 0x8F 0x00 0x00 0x00) ;; 143
(data 0 (i32.const 380) 0x03 0x00 0x00 0x00) ;; 3
(data 0 (i32.const 384) 0x87 0x00 0x00 0x00) ;; 135
(data 0 (i32.const 388) 0x02 0x00 0x00 0x00) ;; 2
(data 0 (i32.const 392) 0x0A 0x00 0x00 0x00) ;; 10
;; r_store_stack
(data 0 (i32.const 396) 0x9B 0x00 0x00 0x00) ;; 155
(data 0 (i32.const 400) 0x02 0x00 0x00 0x00) ;; 2
(data 0 (i32.const 404) 0x84 0x00 0x00 0x00) ;; 132
(data 0 (i32.const 408) 0x01 0x00 0x00 0x00) ;; 1
(data 0 (i32.const 412) 0x0B 0x00 0x00 0x00) ;; 11
;; ret
(data 0 (i32.const 416) 0xA9 0x00 0x00 0x00) ;; 169
(data 0 (i32.const 420) 0x02 0x00 0x00 0x00) ;; 2
(data 0 (i32.const 424) 0x46 0x00 0x00 0x00) ;; 70
(data 0 (i32.const 428) 0x01 0x00 0x00 0x00) ;; 1
(data 0 (i32.const 432) 0x0C 0x00 0x00 0x00) ;; 12

;; *** IMPORTANT NOTE ***
;; Functions below must be declared in the exact same order as
;; the Intruction Set above so that function index in the WASM
;; table match the index in the Instuction set array above
(table 13 funcref)
(elem (i32.const 0)
$b_if, $goto, $goto_past, $n_iadd, $n_ile, $n_ilt, $r_copy, $r_load_1, $r_load_int, $r_load_local, $r_store_int, $r_store_stack, $ret
)

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