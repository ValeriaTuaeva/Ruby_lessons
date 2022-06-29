puts "Как Вас зовут?"
name = gets.chomp
puts "Какой у Вас рост?"
height = gets.chomp
ideal_weight = (height.to_i - 110) * 1.15
if ideal_weight > 0
	puts "#{name}, Ваш идеальный вес #{ideal_weight}"
else
puts "Ваш вес уже оптимальный"
end