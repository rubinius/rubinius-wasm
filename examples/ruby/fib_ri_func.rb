require 'benchmark/ips'

class A

  # def fib(n)
  #   return n if n < 2
  #   fib(n-2) + fib(n-1)
  # end

  dynamic_method :fib do |g|
    g.required_args = 1
    g.total_args = 1
    g.local_count = 1

    r0 = g.new_register
    r1 = g.new_register
    r2 = g.new_register
    r3 = g.new_register

    done = g.new_label

    g.r_load_local r0, 0
    g.r_load_int r1, r0

    g.r_load_1 r3
    g.n_ile r2, r1, r3
    g.b_if r2, done

    # n - 1
    g.n_isub r2, r1, r3

    # n - 2
    g.n_isub r1, r2, r3

    # fib(n - 2)
    g.push_self
    g.r_store_int r1, r1
    g.r_store_stack r1
    g.send :fib, 1, true
    g.r_load_stack r1
    g.r_load_int r1, r1
    g.pop

    # fib(n - 1)
    g.push_self
    g.r_store_int r2, r2
    g.r_store_stack r2
    g.send :fib, 1, true
    g.r_load_stack r2
    g.r_load_int r2, r2
    g.pop

    # +
    g.n_iadd r0, r1, r2
    g.r_store_int r0, r0

    done.set!
    g.r_store_stack r0
    g.ret
  end

  # def fibi(n)
  #   return n if n < 2
  #   i = 2
  #   a = 1
  #   b = 1
  #   while i < n
  #     t = a
  #     a += b
  #     b = t
  #     i += 1
  #   end
  #   a
  # end
  dynamic_method :fibi do |g|
    g.required_args = 1
    g.total_args = 1
    g.local_count = 1

    r0 = g.new_register
    r1 = g.new_register
    r2 = g.new_register
    r3 = g.new_register
    r4 = g.new_register
    r5 = g.new_register
    r6 = g.new_register

    top = g.new_label
    body = g.new_label
    int = g.new_label
    done = g.new_label

    g.r_load_1 r1

    g.r_load_local r0, 0
    g.r_load_int r2, r0

    # n <= 1
    g.n_ile r3, r2, r1
    g.b_if r3, done

    # a = 1, r0
    g.r_load_1 r0

    # b = 1, r3
    g.r_load_1 r3

    # i = 2, r4
    g.n_iadd r4, r0, r0

    top.set!

    # i < n, r4 < r2
    # g.n_ilt r5, r4, r2
    # g.b_if r5, body
    # g.goto int

    g.n_ige r5, r4, r2
    g.b_if r5, int

    body.set!

    # t = a, r6
    g.r_copy r6, r0

    # a += b
    g.n_iadd r0, r0, r3

    # b = t
    g.r_copy r3, r6

    # i += 1
    g.n_iadd r4, r4, r1

    # loop
    g.goto_past top

    int.set!
    g.r_store_int r0, r0

    done.set!
    g.r_store_stack r0
    g.ret
  end
end

# puts A.instance_method(:fib).executable.decode

define_method(:fib, &A.new.method(:fib))
define_method(:fibi, &A.new.method(:fibi))

p fib(40), fibi(40)

Benchmark.ips do |x|
  x.report 'fib(40)', %{ fib(40) }
  x.report 'fibi(40)', %{ fibi(40) }
end