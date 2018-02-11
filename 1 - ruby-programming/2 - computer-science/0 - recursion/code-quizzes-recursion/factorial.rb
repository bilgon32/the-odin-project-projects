def factorial(n)
  return 1 if n <= 1
  return factorial(n - 1) * n
end

p factorial(0)
p factorial(1)
p factorial(5)
p factorial(10)
