# Создание класса Route (Маршрут)
class Route

# Имеет начальную и конечную станцию, а также список промежуточных станций. 
# Начальная и конечная станции указываются при создании маршрута, а промежуточные могут добавляться между ними.
	def initialize(first_station, last_station)
		@first_station = first_station
		@last_station = last_station
		@stations_list = Array.new
		@stations_list << @first_station
		@stations_list << @last_station
	end

# Может добавлять промежуточную станцию в список
	def add_station(name_of_station, index)
		if index != 0 && index < @stations_list.length
			@stations_list.insert(index, name_of_station)
		end
	end

# Может удалять промежуточную станцию из списка
	def delete_station(index)
		if index != 0 && index < @stations_list.length
			@stations_list.delete_at(index)
		end
	end

# Может выводить список всех станций по порядку от начальной до конечной
	def show_route
		@stations_list
	end

end