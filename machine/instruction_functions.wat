
;; Rubinius WebAssembly VM
;; Copyright (c) 2019, Laurent Julliard and contributors
;; All rights reserved.

;; ===================================================
;; Instruction functions
;;

(func $insn::add_scope (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; allow_private 
(func $insn::allow_private (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; cast_array 
(func $insn::cast_array (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; cast_for_multi_block_arg 
(func $insn::cast_for_multi_block_arg (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; cast_for_single_block_arg 
(func $insn::cast_for_single_block_arg (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; cast_for_splat_block_arg 
(func $insn::cast_for_splat_block_arg (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; cast_multi_value 
(func $insn::cast_multi_value (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; check_frozen 
(func $insn::check_frozen (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; check_interrupts 
(func $insn::check_interrupts (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; check_serial literal, serial
(func $insn::check_serial (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; check_serial_private literal, serial
(func $insn::check_serial_private (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; clear_exception 
(func $insn::clear_exception (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; create_block literal
(func $insn::create_block (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; dup 
(func $insn::dup (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; dup_many count
(func $insn::dup_many (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; ensure_return 
(func $insn::ensure_return (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; find_const literal
(func $insn::find_const (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; goto location
(func $insn::goto (param $cf i32)
  nop
)
;; goto_if_equal location
(func $insn::goto_if_equal (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; goto_if_false location
(func $insn::goto_if_false (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; goto_if_nil location
(func $insn::goto_if_nil (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; goto_if_not_equal location
(func $insn::goto_if_not_equal (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; goto_if_not_nil location
(func $insn::goto_if_not_nil (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; goto_if_not_undefined location
(func $insn::goto_if_not_undefined (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; goto_if_true location
(func $insn::goto_if_true (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; goto_if_undefined location
(func $insn::goto_if_undefined (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; instance_of 
(func $insn::instance_of (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; invoke_primitive literal, count
(func $insn::invoke_primitive (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; kind_of 
(func $insn::kind_of (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; make_array count
(func $insn::make_array (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; move_down positions
(func $insn::move_down (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; noop 
(func $insn::noop (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; object_to_s literal
(func $insn::object_to_s (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; passed_arg index
(func $insn::passed_arg (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; passed_blockarg count
(func $insn::passed_blockarg (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; pop 
(func $insn::pop (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; pop_many count
(func $insn::pop_many (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; pop_unwind 
(func $insn::pop_unwind (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; push_block 
(func $insn::push_block (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; push_block_arg 
(func $insn::push_block_arg (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; push_const literal
(func $insn::push_const (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; push_cpath_top 
(func $insn::push_cpath_top (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; push_current_exception 
(func $insn::push_current_exception (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; push_exception_state 
(func $insn::push_exception_state (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; push_false 
(func $insn::push_false (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; push_has_block 
(func $insn::push_has_block (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; push_int number
(func $insn::push_int (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; push_ivar literal
(func $insn::push_ivar (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; push_literal literal
(func $insn::push_literal (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; push_local local
(func $insn::push_local (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; push_local_depth depth, index
(func $insn::push_local_depth (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; push_memo literal
(func $insn::push_memo (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; push_mirror 
(func $insn::push_mirror (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; push_my_field index
(func $insn::push_my_field (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; push_my_offset index
(func $insn::push_my_offset (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; push_nil 
(func $insn::push_nil (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; push_proc 
(func $insn::push_proc (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; push_rubinius 
(func $insn::push_rubinius (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; push_scope 
(func $insn::push_scope (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; push_self 
(func $insn::push_self (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; push_stack_local which
(func $insn::push_stack_local (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; push_true 
(func $insn::push_true (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; push_type 
(func $insn::push_type (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; push_undef 
(func $insn::push_undef (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; push_variables 
(func $insn::push_variables (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; raise_break 
(func $insn::raise_break (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; raise_exc 
(func $insn::raise_exc (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; raise_return 
(func $insn::raise_return (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; reraise 
(func $insn::reraise (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; restore_exception_state 
(func $insn::restore_exception_state (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; ret index
(func $insn::ret (param $state i32) (param $cf i32) (result i32)
  ;; TODO: implement C++ equivalent - Don't know how to do that for now
  ;; if(call_frame->scope->made_alias_p()) {
  ;;   call_frame->scope->flush_to_heap(state);
  ;; }
  (return (call $stack_top (local.get $cf)))
)
;; rotate count
(func $insn::rotate (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; send_method literal
(func $insn::send_method (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; send_stack literal, count
(func $insn::send_stack (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; send_stack_with_block literal, count
(func $insn::send_stack_with_block (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; send_stack_with_splat literal, count
(func $insn::send_stack_with_splat (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; send_super_stack_with_block literal, count
(func $insn::send_super_stack_with_block (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; send_super_stack_with_splat literal, count
(func $insn::send_super_stack_with_splat (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; send_vcall literal
(func $insn::send_vcall (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; set_call_flags flags
(func $insn::set_call_flags (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; set_const literal
(func $insn::set_const (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; set_const_at literal
(func $insn::set_const_at (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; set_ivar literal
(func $insn::set_ivar (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; set_local local
(func $insn::set_local (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; set_local_depth depth, index
(func $insn::set_local_depth (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; set_stack_local which
(func $insn::set_stack_local (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; setup_unwind ip, type
(func $insn::setup_unwind (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; shift_array 
(func $insn::shift_array (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; store_my_field index
(func $insn::store_my_field (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; string_append 
(func $insn::string_append (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; string_build count
(func $insn::string_build (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; string_dup 
(func $insn::string_dup (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; swap 
(func $insn::swap (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; unwind ip
(func $insn::unwind (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; yield_debugger 
(func $insn::yield_debugger (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; yield_splat count
(func $insn::yield_splat (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; yield_stack count
(func $insn::yield_stack (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; zsuper literal
(func $insn::zsuper (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; push_file 
(func $insn::push_file (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; p_any r0
(func $insn::p_any (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; p_call ip
(func $insn::p_call (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; p_char chr
(func $insn::p_char (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; p_char_set chr_set
(func $insn::p_char_set (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; p_choice ip, r0
(func $insn::p_choice (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; p_commit ip
(func $insn::p_commit (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; p_commit_back ip
(func $insn::p_commit_back (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; p_commit_partial ip
(func $insn::p_commit_partial (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; p_end 
(func $insn::p_end (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; p_fail 
(func $insn::p_fail (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; p_fail_twice 
(func $insn::p_fail_twice (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; p_jump ip
(func $insn::p_jump (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; p_return 
(func $insn::p_return (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; p_span chr_set
(func $insn::p_span (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; p_test_any n, ip
(func $insn::p_test_any (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; p_test_char chr, ip
(func $insn::p_test_char (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; p_test_char_set chr_set, ip
(func $insn::p_test_char_set (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; p_init r0, r1
(func $insn::p_init (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; m_bytes value, r0
(func $insn::m_bytes (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; m_counter value
(func $insn::m_counter (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; m_sum value, r0
(func $insn::m_sum (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; m_value value, r0
(func $insn::m_value (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; m_time_stamp value, flag
(func $insn::m_time_stamp (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; m_timer_start timer
(func $insn::m_timer_start (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; m_timer_stop ip, flag
(func $insn::m_timer_stop (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; b_if_serial r0, r1, ip
(func $insn::b_if_serial (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; b_if_int r0, r1, ip
(func $insn::b_if_int (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; b_if r0, ip
(func $insn::b_if (param $cf i32) (param $r0 i32) (result i32)
  (i64.ne
    (call $reg_get (local.get $cf) (local.get $r0))
    (i64.const 0)
  )
)
;; r_load_local r0, local
(func $insn::r_load_local (param $cf i32) (param $r0 i32) (param $local i32)
  ;; TODO: implement the RVAL macro like in C++
  ;; RVAL(r0) = .....
  (call $reg_set
    (local.get $cf)
    (local.get $r0)
    (call $local_get (local.get $cf) (local.get $local))
  )
)
;; r_store_local r0, local
(func $insn::r_store_local (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; r_load_local_depth r0, local, depth
(func $insn::r_load_local_depth (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; r_store_local_depth r0, local, depth
(func $insn::r_store_local_depth (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; r_load_stack r0
(func $insn::r_load_stack (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; r_store_stack r0
(func $insn::r_store_stack (param $cf i32) (param $r0 i32)
  ;; TODO: check if we need to implement the RVAL logic as in
  ;; https://github.com/rubinius/rubinius/blob/36e2be5ee5a06dbd788870e3692b397abdc9f4f3/machine/instructions/r_store_stack.hpp
  (call $stack_push 
    (local.get $cf)
    (call $reg_get (local.get $cf) (local.get $r0))
  )
)
;; r_load_literal r0, literal
(func $insn::r_load_literal (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; r_load_int r0, r1
(func $insn::r_load_int (param $state i32) (param $cf i32) (param $r0 i32) (param $r1 i32)
  (local $r1_val i64)
  (local.set $r1_val (call $reg_get (local.get $cf) (local.get $r1)))

  ;; TODO: the fixnum logic is missing 
  ;; (see https://github.com/rubinius/rubinius/blob/master/machine/instructions/r_load_int.hpp)
  ;; For now let's just assume it's WASM int
  (call $reg_set (local.get $cf) (local.get $r0) (local.get $r1_val))
)
;; r_store_int r0, r1
(func $insn::r_store_int (param $state i32) (param $cf i32) (param $r0 i32) (param $r1 i32)
  (local $r1_val i64)
  (local.set $r1_val (call $reg_get (local.get $cf) (local.get $r1)))

  ;; TODO: the fixnum/bignum logic is missing 
  ;; (https://github.com/rubinius/rubinius/blob/master/machine/instructions/r_store_int.hpp)
  ;; For now let's just assume it's WASM int
  (call $reg_set (local.get $cf) (local.get $r0) (local.get $r1_val))
)
;; r_copy r0, r1
(func $insn::r_copy (param $cf i32) (param $r0 i32) (param $r1 i32)
  (call $reg_set
    (local.get $cf)
    (local.get $r0)
    (call $reg_get (local.get $cf) (local.get $r1))
  )
)
;; n_iadd r0, r1, r2
(func $insn::n_iadd (param $cf i32) (param $r0 i32) (param $r1 i32) (param $r2 i32)
  (call $reg_set
    (local.get $cf)
    (local.get $r0)
    (i64.add
      (call $reg_get (local.get $cf) (local.get $r1))
      (call $reg_get (local.get $cf) (local.get $r2))
    )
  )
)
;; n_isub r0, r1, r2
(func $insn::n_isub (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; n_imul r0, r1, r2
(func $insn::n_imul (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; n_idiv r0, r1, r2
(func $insn::n_idiv (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; n_iadd_o r0, r1, r2
(func $insn::n_iadd_o (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; n_isub_o r0, r1, r2
(func $insn::n_isub_o (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; n_imul_o r0, r1, r2
(func $insn::n_imul_o (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; n_idiv_o r0, r1, r2
(func $insn::n_idiv_o (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; n_ieq r0, r1, r2
(func $insn::n_ieq (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; n_ine r0, r1, r2
(func $insn::n_ine (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; n_ilt r0, r1, r2
(func $insn::n_ilt (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; n_ile r0, r1, r2
(func $insn::n_ile (param $cf i32) (param $r0 i32) (param $r1 i32) (param $r2 i32)
  (if 
    (i64.le_s
      (call $reg_get (local.get $cf) (local.get $r1)) ;; r1
      (call $reg_get (local.get $cf) (local.get $r2)) ;; r2
    )
    (then    ;; r0 = 1 (true)
      (call $reg_set (local.get $cf) (local.get $r0) (i64.const 1))
    )
    (else    ;; r0 = 0 (false)
      (call $reg_set (local.get $cf) (local.get $r0) (i64.const 0))
    )
  )
)
;; n_igt r0, r1, r2
(func $insn::n_igt (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; n_ige r0, r1, r2
(func $insn::n_ige (param $cf i32) (param $r0 i32) (param $r1 i32) (param $r2 i32)
  (if 
    (i64.ge_s
      (call $reg_get (local.get $cf) (local.get $r1)) ;; r1
      (call $reg_get (local.get $cf) (local.get $r2)) ;; r2
    )
    (then    ;; r0 = 1 (true)
      (call $reg_set (local.get $cf) (local.get $r0) (i64.const 1))
    )
    (else    ;; r0 = 0 (false)
      (call $reg_set (local.get $cf) (local.get $r0) (i64.const 0))
    )
  )
)
;; n_ipopcnt r0, r1
(func $insn::n_ipopcnt (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; m_log r0
(func $insn::m_log (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; m_debug 
(func $insn::m_debug (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; e_cache_method_p r0, r1, ip
(func $insn::e_cache_method_p (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; e_cache_function_p r0, r1, ip
(func $insn::e_cache_function_p (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; e_cache_value_p r0, ip
(func $insn::e_cache_value_p (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; e_cache_method r0, ip
(func $insn::e_cache_method (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; e_cache_function r0, ip
(func $insn::e_cache_function (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; e_cache_value r0, ip
(func $insn::e_cache_value (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; e_resolve_method r0, r1, ip
(func $insn::e_resolve_method (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; e_resolve_receiver_method r0, r1, ip
(func $insn::e_resolve_receiver_method (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; e_resolve_function r0, r1, ip
(func $insn::e_resolve_function (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; e_resolve_scope_constant r0, ip
(func $insn::e_resolve_scope_constant (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; e_resolve_path_constant r0, ip
(func $insn::e_resolve_path_constant (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; e_signature r0
(func $insn::e_signature (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; e_check_signature r0, r1
(func $insn::e_check_signature (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; e_invoke_method r0, r1
(func $insn::e_invoke_method (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; e_invoke_function r0, r1
(func $insn::e_invoke_function (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; a_instance r0, r1
(func $insn::a_instance (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; a_kind r0, r1
(func $insn::a_kind (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; a_method r0, r1
(func $insn::a_method (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; a_receiver_method r0, r1
(func $insn::a_receiver_method (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; a_type r0, r1
(func $insn::a_type (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; a_function r0, r1
(func $insn::a_function (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; a_equal r0, r1
(func $insn::a_equal (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; a_not_equal r0, r1
(func $insn::a_not_equal (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; a_less r0, r1
(func $insn::a_less (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; a_less_equal r0, r1
(func $insn::a_less_equal (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; a_greater r0, r1
(func $insn::a_greater (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; a_greater_equal r0, r1
(func $insn::a_greater_equal (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; goto_past location
(func $insn::goto_past (param $cf i32)
  ;; TODO: the rbx interperter does a 'state->vm()->checkpoint(state)'
  ;; but I'm not sure what it means
  ;; for now just branch to the given location
  ;; state->vm()->checkpoint(state);
)
;; goto_future location
(func $insn::goto_future (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; r_load_0 r0
(func $insn::r_load_0 (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; r_load_1 r0
(func $insn::r_load_1 (param $cf i32) (param $r0 i32)
  (call $reg_set (local.get $cf) (local.get $r0) (i64.const 1))
)
;; r_load_nil r0, r1
(func $insn::r_load_nil (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; r_load_false r0
(func $insn::r_load_false (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; r_load_true r0
(func $insn::r_load_true (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; call_send literal, count
(func $insn::call_send (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; call literal, count
(func $insn::call (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; call_0 literal
(func $insn::call_0 (param $state i32) (param $cf i32)
  (call $not_implemented)
)
;; push_tagged_nil nil
(func $insn::push_tagged_nil (param $state i32) (param $cf i32)
  (call $not_implemented)
)

  ;; %% END OF GENERATED INTRUCTION SET DATA %%
