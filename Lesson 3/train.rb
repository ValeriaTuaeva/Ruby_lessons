load './station.rb'
load './route.rb'

# Создание класса Train (Поезд)
class Train

	attr_accessor :route, :type, :current_station, :speed

# Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, 
# эти данные указываются при создании экземпляра класса
	def initialize(number, type, quantity_of_wagons)
		@number = number
		@type = type
		@quantity_of_wagons = quantity_of_wagons
		@type = type if type == :passenger || type == :fright
		@speed = 0
	end
# Может набирать скорость
	def speed_pick_up(speed)
		@speed += speed
		@speed = 0 if @speed < 0
	end

# Может возвращать текущую скорость и текущую станцию
	def current_speed
		@speed
	end

	def current_station
		@current_station
	end

# Может тормозить (сбрасывать скорость до нуля)
	def stop
		@speed = 0
	end

# Может возвращать количество вагонов
	def wagons
		@quantity_of_wagons
	end

# Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает 
# или уменьшает количество вагонов). Прицепка/отцепка вагонов может осуществляться только 
# если поезд не движется.
	def increase_wagons
		@quantity_of_wagons += 1 if @speed == 0
	end

	def decrease_wagons
		@quantity_of_wagons -= 1 if @speed == 0 && @quantity_of_wagons > 0
	end

# Может принимать маршрут следования (объект класса Route). 
# При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
	def set_route(route)
		@route = route
		stations_list.first.accept_train(self)
		@current_station = stations_list.first
	end

# Может перемещаться между станциями, указанными в маршруте. 
# Перемещение возможно вперед и назад, но только на 1 станцию за раз.
	def move_forward
		index = stations_list.index(@current_station)
		next_station = stations_list[index+1]
		unless next_station.nil?
			@current_station.send_train 
			@current_station = next_station 
			@current_station.accept_train(self)
		end
	end

	def move_backwards
		index = stations_list.index(@current_station)
		next_station = stations_list[index-1]
		if !next_station.nil? && next_station != stations_list.last 
			@current_station.send_train
			@current_station = next_station
			@current_station.accept_train(self)
		end
	end

# Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
	def next_station
		index = stations_list.index(@current_station)
		if next_station = stations_list[index + 1]
			next_station
		else
			puts "This is the last station"
		end
	end

	def previous_station
		index = stations_list.index(@current_station)
		previous_station = stations_list[index - 1]
		if previous_station != stations_list.last
			previous_station
		else
			puts "This is the first station"
		end
	end

	def stations_list
		@route.show_route
	end

end