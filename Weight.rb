puts "введите Ваше имя"
name = gets.chomp
puts "введите Ваш рост"
weight = gets.chomp
puts "#{name}, твой идеальный вес #{(110 - weight. to_i) * 1.15}"