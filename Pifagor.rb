puts "сторона a"
a = gets.chomp.to_i
puts " сторона b"
b = gets.chomp.to_i
puts "сторона c"
c = gets.chomp. to_i
if a == b + c || b == c + a || c == a + b 
  puts " этот треугольник прямоугольный "
end
if a == b && a == c
  puts "этот треугольник равносторонний"
else a == b && a < c
  puts "этот треугольник равнобедренный"
end 