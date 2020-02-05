 puts 'a = '
a = gets.chomp.to_f
puts 'b = '
b = gets.chomp.to_f
puts 'c = '
c = gets.chomp.to_f
d =  (b * b - 4 * a * c).to_i
if (d == 0)
  puts 'x = '+ (- b / 2 / a).to_s
elsif (d > 0)
sqrt_d = Math.sqrt(d)
  puts "x1 = #{(- b - sqrt_d) / 2 / a}"
  puts "x2 = #{(- b + sqrt_d) / 2 / a}"
else (d < 0)
  puts "корней нет"
end