;; Rubinius WebAssembly VM
;; Copyright (c) 2019, Laurent Julliard and contributors
;; All rights reserved.


;; *** IMPORTANT NOTE ***
;; Functions below must be declared in the exact same order as
;; the Intruction Set above so that function index in the WASM
;; table match the index in the Instuction set array above
(type $insn_t (func (param i32) (param i32) (param i32)))
(table 192 funcref)
(elem (offset (i32.const 0))
$add_scope $allow_private $cast_array $cast_for_multi_block_arg $cast_for_single_block_arg
$cast_for_splat_block_arg $cast_multi_value $check_frozen $check_interrupts $check_serial 
$check_serial_private $clear_exception $create_block $dup $dup_many $ensure_return $find_const 
$goto $goto_if_equal $goto_if_false $goto_if_nil $goto_if_not_equal $goto_if_not_nil 
$goto_if_not_undefined $goto_if_true $goto_if_undefined $instance_of $invoke_primitive 
$kind_of $make_array $move_down $noop $object_to_s $passed_arg $passed_blockarg $pop $pop_many 
$pop_unwind $push_block $push_block_arg $push_const $push_cpath_top $push_current_exception 
$push_exception_state $push_false $push_has_block $push_int $push_ivar $push_literal $push_local 
$push_local_depth $push_memo $push_mirror $push_my_field $push_my_offset $push_nil $push_proc 
$push_rubinius $push_scope $push_self $push_stack_local $push_true $push_type $push_undef 
$push_variables $raise_break $raise_exc $raise_return $reraise $restore_exception_state $ret 
$rotate $send_method $send_stack $send_stack_with_block $send_stack_with_splat 
$send_super_stack_with_block $send_super_stack_with_splat $send_vcall $set_call_flags 
$set_const $set_const_at $set_ivar $set_local $set_local_depth $set_stack_local 
$setup_unwind $shift_array $store_my_field $string_append $string_build $string_dup $swap 
$unwind $yield_debugger $yield_splat $yield_stack $zsuper $push_file $p_any $p_call $p_char 
$p_char_set $p_choice $p_commit $p_commit_back $p_commit_partial $p_end $p_fail $p_fail_twice 
$p_jump $p_return $p_span $p_test_any $p_test_char $p_test_char_set $p_init $m_bytes $m_counter 
$m_sum $m_value $m_time_stamp $m_timer_start $m_timer_stop $b_if_serial $b_if_int $b_if 
$r_load_local $r_store_local $r_load_local_depth $r_store_local_depth $r_load_stack $r_store_stack 
$r_load_literal $r_load_int $r_store_int $r_copy $n_iadd $n_isub $n_imul $n_idiv $n_iadd_o 
$n_isub_o $n_imul_o $n_idiv_o $n_ieq $n_ine $n_ilt $n_ile $n_igt $n_ige $n_ipopcnt $m_log 
$m_debug $e_cache_method_p $e_cache_function_p $e_cache_value_p $e_cache_method $e_cache_function 
$e_cache_value $e_resolve_method $e_resolve_receiver_method $e_resolve_function 
$e_resolve_scope_constant $e_resolve_path_constant $e_signature $e_check_signature $e_invoke_method 
$e_invoke_function $a_instance $a_kind $a_method $a_receiver_method $a_type $a_function $a_equal 
$a_not_equal $a_less $a_less_equal $a_greater $a_greater_equal $goto_past $goto_future $r_load_0 
$r_load_1 $r_load_nil $r_load_false $r_load_true $call_send $call $call_0 $push_tagged_nil
)

;; Raise exception
;; invoked from rbx instructions not yet implemented
(func $not_implemented
  unreachable
)

;; ===================================================
;; Interpreter functions
;;
;; $cf and $r? parameters are i32 because they are passed as 
;;  indices (eg. 1st call frame is 0, r0 is 0, r1 is 1,...)
;; $1, $2 params are 64 bits because they are Ruby values
;; (TODO: does this make sense ??)
;; add_scope 
(func $add_scope (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; allow_private 
(func $allow_private (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; cast_array 
(func $cast_array (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; cast_for_multi_block_arg 
(func $cast_for_multi_block_arg (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; cast_for_single_block_arg 
(func $cast_for_single_block_arg (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; cast_for_splat_block_arg 
(func $cast_for_splat_block_arg (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; cast_multi_value 
(func $cast_multi_value (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; check_frozen 
(func $check_frozen (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; check_interrupts 
(func $check_interrupts (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; check_serial literal, serial
(func $check_serial (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; check_serial_private literal, serial
(func $check_serial_private (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; clear_exception 
(func $clear_exception (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; create_block literal
(func $create_block (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; dup 
(func $dup (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; dup_many count
(func $dup_many (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; ensure_return 
(func $ensure_return (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; find_const literal
(func $find_const (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; goto location
(func $goto (param $state i32) (param $cf i32) (param $opcodes i32)
  (local $location i32)
  
  (local.set $location (call $ip_get_arg_1 (local.get $cf)))
  (call $insn::goto (local.get $cf))
  (call $ip_set (local.get $cf) (local.get $location))
)
;; goto_if_equal location
(func $goto_if_equal (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; goto_if_false location
(func $goto_if_false (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; goto_if_nil location
(func $goto_if_nil (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; goto_if_not_equal location
(func $goto_if_not_equal (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; goto_if_not_nil location
(func $goto_if_not_nil (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; goto_if_not_undefined location
(func $goto_if_not_undefined (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; goto_if_true location
(func $goto_if_true (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; goto_if_undefined location
(func $goto_if_undefined (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; instance_of 
(func $instance_of (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; invoke_primitive literal, count
(func $invoke_primitive (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; kind_of 
(func $kind_of (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; make_array count
(func $make_array (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; move_down positions
(func $move_down (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; noop 
(func $noop (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; object_to_s literal
(func $object_to_s (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; passed_arg index
(func $passed_arg (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; passed_blockarg count
(func $passed_blockarg (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; pop 
(func $pop (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; pop_many count
(func $pop_many (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; pop_unwind 
(func $pop_unwind (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; push_block 
(func $push_block (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; push_block_arg 
(func $push_block_arg (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; push_const literal
(func $push_const (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; push_cpath_top 
(func $push_cpath_top (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; push_current_exception 
(func $push_current_exception (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; push_exception_state 
(func $push_exception_state (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; push_false 
(func $push_false (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; push_has_block 
(func $push_has_block (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; push_int number
(func $push_int (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; push_ivar literal
(func $push_ivar (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; push_literal literal
(func $push_literal (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; push_local local
(func $push_local (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; push_local_depth depth, index
(func $push_local_depth (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; push_memo literal
(func $push_memo (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; push_mirror 
(func $push_mirror (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; push_my_field index
(func $push_my_field (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; push_my_offset index
(func $push_my_offset (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; push_nil 
(func $push_nil (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; push_proc 
(func $push_proc (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; push_rubinius 
(func $push_rubinius (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; push_scope 
(func $push_scope (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; push_self 
(func $push_self (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; push_stack_local which
(func $push_stack_local (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; push_true 
(func $push_true (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; push_type 
(func $push_type (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; push_undef 
(func $push_undef (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; push_variables 
(func $push_variables (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; raise_break 
(func $raise_break (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; raise_exc 
(func $raise_exc (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; raise_return 
(func $raise_return (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; reraise 
(func $reraise (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; restore_exception_state 
(func $restore_exception_state (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; ret index
(func $ret (param $state i32) (param $cf i32) (param $opcodes i32)

  ;; TODO: implement the C++ equivalent - don't know how to do that for now
  ;; state->vm()->checkpoint(state);

  ;; TODO: implement some more stack management logic as in
  ;; and also see how to return the stack top value as instruction function
  ;; type doesn't allow a (result i32) - see type $insn_t
  ;; https://github.com/rubinius/rubinius/blob/36e2be5ee5a06dbd788870e3692b397abdc9f4f3/machine/instructions/ret.hpp
  (drop (return (call $insn::ret (local.get $state) (local.get $cf))))
)
;; rotate count
(func $rotate (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; send_method literal
(func $send_method (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; send_stack literal, count
(func $send_stack (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; send_stack_with_block literal, count
(func $send_stack_with_block (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; send_stack_with_splat literal, count
(func $send_stack_with_splat (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; send_super_stack_with_block literal, count
(func $send_super_stack_with_block (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; send_super_stack_with_splat literal, count
(func $send_super_stack_with_splat (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; send_vcall literal
(func $send_vcall (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; set_call_flags flags
(func $set_call_flags (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; set_const literal
(func $set_const (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; set_const_at literal
(func $set_const_at (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; set_ivar literal
(func $set_ivar (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; set_local local
(func $set_local (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; set_local_depth depth, index
(func $set_local_depth (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; set_stack_local which
(func $set_stack_local (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; setup_unwind ip, type
(func $setup_unwind (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; shift_array 
(func $shift_array (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; store_my_field index
(func $store_my_field (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; string_append 
(func $string_append (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; string_build count
(func $string_build (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; string_dup 
(func $string_dup (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; swap 
(func $swap (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; unwind ip
(func $unwind (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; yield_debugger 
(func $yield_debugger (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; yield_splat count
(func $yield_splat (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; yield_stack count
(func $yield_stack (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; zsuper literal
(func $zsuper (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; push_file 
(func $push_file (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; p_any r0
(func $p_any (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; p_call ip
(func $p_call (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; p_char chr
(func $p_char (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; p_char_set chr_set
(func $p_char_set (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; p_choice ip, r0
(func $p_choice (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; p_commit ip
(func $p_commit (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; p_commit_back ip
(func $p_commit_back (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; p_commit_partial ip
(func $p_commit_partial (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; p_end 
(func $p_end (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; p_fail 
(func $p_fail (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; p_fail_twice 
(func $p_fail_twice (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; p_jump ip
(func $p_jump (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; p_return 
(func $p_return (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; p_span chr_set
(func $p_span (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; p_test_any n, ip
(func $p_test_any (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; p_test_char chr, ip
(func $p_test_char (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; p_test_char_set chr_set, ip
(func $p_test_char_set (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; p_init r0, r1
(func $p_init (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; m_bytes value, r0
(func $m_bytes (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; m_counter value
(func $m_counter (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; m_sum value, r0
(func $m_sum (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; m_value value, r0
(func $m_value (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; m_time_stamp value, flag
(func $m_time_stamp (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; m_timer_start timer
(func $m_timer_start (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; m_timer_stop ip, flag
(func $m_timer_stop (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; b_if_serial r0, r1, ip
(func $b_if_serial (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; b_if_int r0, r1, ip
(func $b_if_int (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; b_if r0, ip
(func $b_if (param $state i32) (param $cf i32) (param $opcodes i32)
  (local $r0 i32)

  (local.set $r0 (call $ip_get_arg_1 (local.get $cf)))
  (if
    (i32.eqz (call $insn::b_if (local.get $cf) (local.get $r0)))
    (then 
      ;; == 0 means false, don't branch keep going
      (call $ip_next (local.get $cf) )
    )
    (else
      ;; != 0 means true, branch
      (call $ip_set 
        (local.get $cf) 
        (call $ip_get_arg_2 (local.get $cf))
      )
    )
  )
)
;; r_load_local r0, local
(func $r_load_local (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $insn::r_load_local 
    (local.get $cf)
    (call $ip_get_arg_1 (local.get $cf)) ;; register id
    (call $ip_get_arg_2 (local.get $cf)) ;; local id
  )
  (call $ip_next (local.get $cf))
)
;; r_store_local r0, local
(func $r_store_local (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; r_load_local_depth r0, local, depth
(func $r_load_local_depth (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; r_store_local_depth r0, local, depth
(func $r_store_local_depth (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; r_load_stack r0
(func $r_load_stack (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; r_store_stack r0
(func $r_store_stack (param $state i32) (param $cf i32) (param $opcodes i32)
  ;; TODO: check if we need to implement the RVAL logic as in
  ;; https://github.com/rubinius/rubinius/blob/36e2be5ee5a06dbd788870e3692b397abdc9f4f3/machine/instructions/r_store_stack.hpp
  (call $insn::r_store_stack  
    (local.get $cf)
    (call $ip_get_arg_1 (local.get $cf))
  )
  (call $ip_next (local.get $cf))
)
;; r_load_literal r0, literal
(func $r_load_literal (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; r_load_int r0, r1
(func $r_load_int (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $insn::r_load_int  
    (local.get $state)
    (local.get $cf)
    (call $ip_get_arg_1 (local.get $cf))
    (call $ip_get_arg_2 (local.get $cf))
  )
  (call $ip_next (local.get $cf))
)
;; r_store_int r0, r1
(func $r_store_int (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $insn::r_store_int
   (local.get $state)
   (local.get $cf)
    (call $ip_get_arg_1 (local.get $cf))
    (call $ip_get_arg_2 (local.get $cf))
  )
  (call $ip_next (local.get $cf))
)
;; r_copy r0, r1
(func $r_copy (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $insn::r_copy  
    (local.get $cf)
    (call $ip_get_arg_1 (local.get $cf))
    (call $ip_get_arg_2 (local.get $cf))
  )
  (call $ip_next (local.get $cf))
)
;; n_iadd r0, r1, r2
(func $n_iadd (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $insn::n_iadd 
    (local.get $cf)
    (call $ip_get_arg_1 (local.get $cf))
    (call $ip_get_arg_2 (local.get $cf))
    (call $ip_get_arg_3 (local.get $cf))
  )
  (call $ip_next (local.get $cf))
)
;; n_isub r0, r1, r2
(func $n_isub (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; n_imul r0, r1, r2
(func $n_imul (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; n_idiv r0, r1, r2
(func $n_idiv (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; n_iadd_o r0, r1, r2
(func $n_iadd_o (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; n_isub_o r0, r1, r2
(func $n_isub_o (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; n_imul_o r0, r1, r2
(func $n_imul_o (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; n_idiv_o r0, r1, r2
(func $n_idiv_o (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; n_ieq r0, r1, r2
(func $n_ieq (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; n_ine r0, r1, r2
(func $n_ine (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; n_ilt r0, r1, r2
(func $n_ilt (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; n_ile r0, r1, r2
(func $n_ile (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $insn::n_ile
    (local.get $cf)
    (call $ip_get_arg_1 (local.get $cf))
    (call $ip_get_arg_2 (local.get $cf))
    (call $ip_get_arg_3 (local.get $cf))
  )
  (call $ip_next (local.get $cf))
)
;; n_igt r0, r1, r2
(func $n_igt (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; n_ige r0, r1, r2
(func $n_ige (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $insn::n_ige
    (local.get $cf)
    (call $ip_get_arg_1 (local.get $cf))
    (call $ip_get_arg_2 (local.get $cf))
    (call $ip_get_arg_3 (local.get $cf))
  )
  (call $ip_next (local.get $cf))
)
;; n_ipopcnt r0, r1
(func $n_ipopcnt (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; m_log r0
(func $m_log (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; m_debug 
(func $m_debug (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; e_cache_method_p r0, r1, ip
(func $e_cache_method_p (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; e_cache_function_p r0, r1, ip
(func $e_cache_function_p (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; e_cache_value_p r0, ip
(func $e_cache_value_p (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; e_cache_method r0, ip
(func $e_cache_method (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; e_cache_function r0, ip
(func $e_cache_function (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; e_cache_value r0, ip
(func $e_cache_value (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; e_resolve_method r0, r1, ip
(func $e_resolve_method (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; e_resolve_receiver_method r0, r1, ip
(func $e_resolve_receiver_method (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; e_resolve_function r0, r1, ip
(func $e_resolve_function (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; e_resolve_scope_constant r0, ip
(func $e_resolve_scope_constant (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; e_resolve_path_constant r0, ip
(func $e_resolve_path_constant (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; e_signature r0
(func $e_signature (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; e_check_signature r0, r1
(func $e_check_signature (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; e_invoke_method r0, r1
(func $e_invoke_method (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; e_invoke_function r0, r1
(func $e_invoke_function (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; a_instance r0, r1
(func $a_instance (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; a_kind r0, r1
(func $a_kind (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; a_method r0, r1
(func $a_method (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; a_receiver_method r0, r1
(func $a_receiver_method (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; a_type r0, r1
(func $a_type (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; a_function r0, r1
(func $a_function (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; a_equal r0, r1
(func $a_equal (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; a_not_equal r0, r1
(func $a_not_equal (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; a_less r0, r1
(func $a_less (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; a_less_equal r0, r1
(func $a_less_equal (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; a_greater r0, r1
(func $a_greater (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; a_greater_equal r0, r1
(func $a_greater_equal (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; goto_past location
(func $goto_past (param $state i32) (param $cf i32) (param $opcodes i32)
  (local $location i32)

  (local.set $location (call $ip_get_arg_1 (local.get $cf)))
  ;; TODO: the rbx interperter does a 'state->vm()->checkpoint(state)'
  ;; but I'm not sure what it means
  ;; for now just branch to the given location
  (call $ip_set (local.get $cf) (local.get $location))  
)
;; goto_future location
(func $goto_future (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; r_load_0 r0
(func $r_load_0 (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; r_load_1 r0
(func $r_load_1 (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $insn::r_load_1
    (local.get $cf) 
    (call $ip_get_arg_1 (local.get $cf))
  )
  (call $ip_next (local.get $cf))
)
;; r_load_nil r0, r1
(func $r_load_nil (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; r_load_false r0
(func $r_load_false (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; r_load_true r0
(func $r_load_true (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; call_send literal, count
(func $call_send (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; call literal, count
(func $call (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; call_0 literal
(func $call_0 (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)
;; push_tagged_nil nil
(func $push_tagged_nil (param $state i32) (param $cf i32) (param $opcodes i32)
  (call $not_implemented)
)

  ;; %% END OF GENERATED INTRUCTION SET DATA %%
