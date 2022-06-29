puts "Введите данные первой стороны треугольника"
side1 = gets.to_i
puts "Введите данные второй стороны треугольника"
side2 = gets.chomp.to_i
puts "Введите данные третьей стороны треугольника"
side3 = gets.chomp.to_i

#Равносторонний#
equilateral = (side1==side2) && (side2==side3)

#Равнобедренный#
isosceles = (side1==side2) || (side2==side3) || (side1==side3)

#Прямоугольный#
if !equilateral
hypotenuse = [side1,side2,side3].max

if hypotenuse == side1
	rectangular = side1**2 == side2**2 + side3**2
elsif hypotenuse == side2
	rectangular = side2**2 == side1**2 + side3**2
	else
		rectangular = side3**2 == side1**2 + side2**2
	end
end

if equilateral 
	puts " Треугольник равносторонний и равнобедренный"
elsif isosceles && rectangular
	puts "Треугольник равнобедренный и прямоугольный"
elsif rectangular
	puts "Треугольник прямоугольный"
else
	puts "Обычный треугольник"
end




