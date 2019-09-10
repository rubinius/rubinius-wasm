
# From WebAssembly Explorer C99 -O1

(module
 (table 0 anyfunc)
 (memory $0 1)
 (export "memory" (memory $0))
 (export "add" (func $add))
 (export "main" (func $main))
 (func $add (; 0 ;) (param $0 i32) (param $1 i32) (result i32)
  (i32.add
   (get_local $1)
   (get_local $0)
  )
 )
 (func $main (; 1 ;) (result i32)
  (call $add
   (i32.const 2)
   (i32.const 3)
  )
 )
)
