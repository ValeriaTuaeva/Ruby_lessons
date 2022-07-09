# 3. Заполнить массив числами фибоначчи до 100

arr = [0, 1]
index = 2

loop do
  next_index = arr[index - 2] + arr[index - 1]
  break if next_index >= 100
  arr << next_index
  index += 1
end

puts arr