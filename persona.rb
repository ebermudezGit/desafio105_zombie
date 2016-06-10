require './individuo'
class Persona < Individuo

	def correr
		randy=0
		randx=0
		
		direcccion = $direcciones.sample

		if ['ejeX','ejeXY'].include? direcccion
			randx=[-2,2].sample
		end
		if ['ejeY','ejeXY'].include? direcccion
			randy=[-2,2].sample
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

	def gritar(arrayObjetos)
		if enPeligro?($rangoAlcance,elmasCercano?(arrayObjetos))
			puts 'ahhhhhhhhhhh ahhhhhhhhhh ahhhhhhhhhh!!!'
		end
	end

	def enPeligro?(rangoAlcance,objMasCercano)
		estaAlcance?(rangoAlcance,objMasCercano)
	end

end