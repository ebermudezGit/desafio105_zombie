require './individuo'
class Zombie < Individuo

	def caminar
		randy=0
		randx=0
		
		direcccion = $direcciones.sample

		if ['ejeX','ejeXY'].include? direcccion
			randx=[-1,1].sample
		end
		if ['ejeY','ejeXY'].include? direcccion
			randy=[-1,1].sample
		end

		#puts randx,randy

		if @x+randx<$min_x
			randx=@x-$min_x
		elsif @x+randx>$max_x
			randx=$max_x-@x
		end

		if @y+randy<$min_y
			randy=@y-$min_y
		elsif @y+randy>$max_y
			randy=$max_y-@y
		end

		@x=@x+randx
		@y=@y+randy
	end

	def hablar(arrayObjetos)
		if estaAlcance?($rangoAlcance,elmasCercano?(arrayObjetos))
			puts 'BRAINNSS!!!'
		end
	end

end