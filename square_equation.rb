puts "Введите коэффициент a"
a = gets.chomp.to_i
puts "Введите коэффициент b"
b = gets.chomp.to_i
puts "Введите коэффициент c"
c = gets.chomp.to_i

D = b**2 - 4*a*c

if D > 0
	x1 = (-b + Math.sqrt(D)) / (2 * a)
	x2 = (-b - Math.sqrt(D)) / (2 * a)
	puts "Дискриминант равен #{D}, первый корень равен #{x1}, второй корень равен #{x2}"
elsif D == 0
	x = -b/(2 * a)
	puts "Дискриминант равен #{D}, единственный корень равен #{x}"
else
puts "Дискриминант равен #{D}, корней нет"	
end
