# Создание класса Route (Маршрут)
class Route
	
	attr_reader :first_station

	# Имеет начальную и конечную станцию, а также список промежуточных станций. 
	# Начальная и конечная станции указываются при создании маршрута, а промежуточные могут добавляться между ними.
	def initialize(first_station, last_station)
		@first_station = first_station
		@last_station = last_station

		@intermediate_stations = []
	end

	# Может добавлять промежуточную станцию в список
	def add_intermediate_station(station)
		@intermediate_stations << station
	end

	# Может удалять промежуточную станцию из списка
	def delete_intermediate_station(station)
		@intermediate_stations.delete(station)
	end

	# Может выводить список всех станций по порядку от начальной до конечной
	def show_route
		[@first_station] + @intermediate_stations + [@last_station]
	end

end