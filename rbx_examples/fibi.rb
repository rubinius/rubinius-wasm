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
