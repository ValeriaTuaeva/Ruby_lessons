# 4. Заполнить хеш гласными буквами, где значением будет 
# являться порядковый номер буквы в алфавите.

hash = {}
vowels = ['A', 'E', 'I', 'O', 'U']
i = 0

all_letters = ('A'..'Z').to_a

all_letters.each do |a|
i += 1
  if vowels.include? a
    hash[a] = i
  end
end

puts hash
