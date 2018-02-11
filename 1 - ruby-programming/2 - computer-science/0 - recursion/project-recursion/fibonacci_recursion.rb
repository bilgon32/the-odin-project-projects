# Now write another method #fibs_rec which solves the same problem
# recursively. This can be done in just 3 lines (or 1 if you’re crazy,
# but don’t consider either of these lengths a requirement… just get it
# done).

def fibs_rec(n)
  return n if n <= 1
  return fibs_rec(n-1) + fibs_rec(n-2) if n > 1
end

p fibs_rec(0)
p fibs_rec(1)
p fibs_rec(2)
p fibs_rec(3)
p fibs_rec(4)
p fibs_rec(5)
p fibs_rec(6)
p fibs_rec(7)
p fibs_rec(8)
