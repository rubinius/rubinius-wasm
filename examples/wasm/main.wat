# From WebAssembly Studio
(module
  (type $t0 (func))
  (func $__wasm_call_ctors (type $t0))
  (table $T0 1 1 anyfunc)
  (memory $memory (export "memory") 2)
  (global $g0 (mut i32) (i32.const 66560))
  (global $__heap_base (export "__heap_base") i32 (i32.const 66560))
  (global $__data_end (export "__data_end") i32 (i32.const 1024)))

# From WebAssembly Explorer C99 -Os
(module
 (table 0 anyfunc)
 (memory $0 1)
 (export "memory" (memory $0))
 (export "main" (func $main))
 (func $main (; 0 ;) (result i32)
  (i32.const 0)
 )
)

# From emcc -Os -s WASM=1 -o main.WASM
(module
  (type (;0;) (func (result i32)))
  (type (;1;) (func (param i32) (result i32)))
  (func (;0;) (type 0) (result i32)
    i32.const 0)
  (func (;1;) (type 1) (param i32) (result i32)
    (local i32 i32)
    global.get 0
    local.set 2
    local.get 0
    global.get 0
    i32.add
    global.set 0
    global.get 0
    i32.const 15
    i32.add
    i32.const -16
    i32.and
    global.set 0
    local.get 2)
  (global (;0;) (mut i32) (i32.const 2768))
  (export "_main" (func 0))
  (export "stackAlloc" (func 1)))