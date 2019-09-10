  ;; Invoke the fib method from Web browser
  ;; fib(5)
  ;; NOTE: JS doesn't handle i64 type for now. So
  ;; cast i32 to i64 back and forth for now
  ;;(func $main (param $arg i32) (result i32)
  (func $main_js (param $arg i32) (result i32)
    ;; compute fib(5)
    (i32.wrap_i64 
      (call $interpret (i64.extend_i32_s (local.get $arg)))
    )
  )
  (export "main_js" (func $main_js))

  ;; Entry point for CLI execution
  ;;(start $main)

  ;; Invoke the fib method from wasm-interp command line
  ;; WASM start entry point cannot accept argument
  ;; or return any value
  (func $main
    ;; compute fib(16) -> 987
    (call $log_i64
      (call $interpret (i64.const 17))
    )
  )
