# bm_fib.rb
require 'benchmark/ips'

def fib(n)
  return n if n < 2
  fib(n-2) + fib(n-1)
end

def fibi(n)
  return n if n < 2
  i = 2
  a = 1
  b = 1
  while i < n
    t = a
    a += b
    b = t
    i += 1
  end
  a
end

p fib(30), fibi(30)

Benchmark.ips do |x|
  x.report 'fib(30)', %{ fib(30) }
  x.report 'fibi(30)', %{ fibi(30) }
end
