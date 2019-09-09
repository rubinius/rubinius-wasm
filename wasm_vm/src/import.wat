  ;; log function
  ;; - the Host.print function is exported when using -t
  ;;   option with wasm-interp
  (import "host" "print" (func $log_i64 (param i64)))
  (import "host" "print" (func $log_3i32_8i64 (param i32 i32 i32 i64 i64 i64 i64 i64 i64 i64 i64)))