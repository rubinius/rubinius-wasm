
  ;; -----------------------------------------------
  ;; >>>>>>>   Misc. functions

  ;; Log call stack (IP, opcode and registers
  ;; make sure to use  wasm-interp --host-print
  (func $log_cf (param $cf i32)
    (if (i32.eqz (global.get $DEBUG))
      (then (return))
    )
    (call $log_3i32_8i64
      (call $ip_get (local.get $cf)) ;; IP
      (call $stack_ptr_get (local.get $cf)) ;; stack ptr
      (call $ip_get_opcode (local.get $cf)) ;; opcode
      (call $reg_get (local.get $cf) (i32.const 0)) ;; R0
      (call $reg_get (local.get $cf) (i32.const 1)) ;; R1
      (call $reg_get (local.get $cf) (i32.const 2)) ;; R2
      (call $reg_get (local.get $cf) (i32.const 3)) ;; R3
      (call $reg_get (local.get $cf) (i32.const 4)) ;; R4
      (call $reg_get (local.get $cf) (i32.const 5)) ;; R5
      (call $reg_get (local.get $cf) (i32.const 6)) ;; R6
      (call $reg_get (local.get $cf) (i32.const 7)) ;; R7
    )
  )
