  ;; Global variables section

  ;; memory implant addresses
  (global $INSTRUCTIONS (mut i32) (i32.const 2432)) ;;instructions definition
  (global $OPCODES (mut i32) (i32.const 8192))  ;; rbx application program 

  ;; heap base address (make sure it's aligned on 
  ;; an address compatible with the most restrictive data type
  ;; used in WASM. It's i64, so make this address is a multiple of 4
  (global $HEAP (mut i32) (i32.const 10024))
  
  ;; debug flag (1=true, 0=false)
  (global $DEBUG (mut i32) (i32.const 0)) 