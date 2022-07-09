# 5. Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя).
# Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным. 

def leap_year?(year)
  if year % 4 != 0
    return false
  elsif year % 100 != 0
    return true
  else
    return year % 400 == 0
  end
end

puts "Введите день (1-31): "
day = gets.chomp.to_i

puts "Введите месяц (1-12): "
month = gets.chomp.to_i

puts "Введите год: "
year = gets.chomp.to_i

if leap_year? year
  feb_length = 29
  defined_year = 'високосный'
else
  feb_length = 28
  defined_year = 'не високосный'
end

puts "Выбрана дата: #{day}.#{month}.#{year} (#{year} - #{defined_year} год)"

months_length = [31, feb_length, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

days_in_previous_months = 0

for i in 1..month - 1
  days_in_previous_months += months_length[i - 1]
end

days_in_previous_months += day

puts "Порядковый номер даты равен #{days_in_previous_months}"