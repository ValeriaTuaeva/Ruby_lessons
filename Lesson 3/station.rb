# Создание класса Station (Станция)
class Station

# Имеет название, которое указывается при ее создании. Также создан массив с указанием всех поездов на станции.
	def initialize(name)
		@name = name
		@trains = Array.new
	end

# Может принимать поезда (по одному за раз)
	def accept_train(train)
		@trains << train
	end

# Может возвращать список всех поездов на станции, находящиеся в текущий момент
	def trains_list
		@trains
	end

# Может возвращать список поездов на станции по типу (будет указано в классе Train): кол-во грузовых, пассажирских
	def trains_list_by_type(type)
		@trains.select {|train| train.type == type}
	end

# Может отправлять поезда (по одному за раз, при этом поезд удаляется из списка поездов, находящихся на станции).
	def send_train
		@trains.pop
	end

end