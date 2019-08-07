  ;; Global variables section

  (global $OPCODES (mut i32) (i32.const 8192))  ;; rbx program 
  (global $HEAP (mut i32) (i32.const 10024)) ;; heap base address (call frames)
  (global $INSTRUCTIONS (mut i32) (i32.const 2432)) ;;instructions definition
  (global $DEBUG (mut i32) (i32.const 0)) ;; debug flag (1=true, 0=false)