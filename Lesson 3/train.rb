load './station.rb'
load './route.rb'

# Создание класса Train (Поезд)
class Train

	# Может возвращать текущую скорость, текущую станцию, количество вагонов (а также номер, тип вагона, макисимальную скорость)
	attr_accessor :current_station

	attr_reader :number
	attr_reader :quantity_of_wagons
	attr_reader :type
	attr_reader :speed
	attr_reader :max_speed

	# Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, 
	# эти данные указываются при создании экземпляра класса
	def initialize(number, type, quantity_of_wagons)
		@number = number
		@type = type
		@quantity_of_wagons = quantity_of_wagons

		@speed = 0
		@max_speed = 100
		@current_station = nil
	end

	# Может набирать скорость
	def speed_pick_up(speed)
		@speed = speed
		@speed = 0 if @speed < 0
	end

	# Может тормозить (сбрасывать скорость до нуля)
	def stop
		@speed = 0
	end

	# Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает 
	# или уменьшает количество вагонов). Прицепка/отцепка вагонов может осуществляться только 
	# если поезд не движется.
	def increase_wagons
		@quantity_of_wagons += 1 if @speed == 0
	end

	def decrease_wagons
		@quantity_of_wagons -= 1 if (@speed == 0) && (@quantity_of_wagons > 0)
	end

	# Может принимать маршрут следования (объект класса Route). 
	def set_route(route)
		@route = route

	# При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.		
		@route.first_station.accept_train(self)
		@current_station = @route.first_station
	end

	# Может перемещаться между станциями, указанными в маршруте. 
	# Перемещение возможно вперед и назад, но только на 1 станцию за раз.

	# перемещается на следующую станцию
  def move_to_next_station
  	return if next_station.nil?
  	destination = next_station

  	@current_station.send_train(self)
  	@current_station = nil

  	speed_pick_up(max_speed)

 	# едет до станции назначения
    stop 

    @current_station = destination
    @current_station.accept_train(self)

  end

 # перемещается к предыдущей станции
  def move_to_previous_station
  	return if previous_station.nil?
  	destination = previous_station

  	@current_station.send_train(self)
  	@current_station = nil

  	speed_pick_up(max_speed)

 # едет до станции назначения
    stop 

    @current_station = destination
    @current_station.accept_train(self)

  end


	# Возвращать предыдущую и следующую станции на основе маршрута

	def previous_station
		index = @route.show_route.find_index(@current_station)
			if index > 0 
				@route.show_route[index - 1] 
			else
				nil
			end
	end

	def next_station
		index = @route.show_route.find_index(@current_station)
			if index < @route.show_route.length - 1
				@route.show_route[index + 1] 
			else
				nil
			end
	end

end