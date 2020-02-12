fib = [0,1]
 while fib != 100 do
  next_fib = fib[-1] + fib[-2] 
  break if next_fib >= 100
  fib << next_fib
end

puts fib