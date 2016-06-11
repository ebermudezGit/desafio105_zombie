require './individuo'
class Zombie < Individuo

	def caminar
		randy=0;randx=0
		
		direcccion = $direcciones.sample

		randx=[-1,1].sample if ['ejeX','ejeXY'].include? direcccion
		
		randy=[-1,1].sample if ['ejeY','ejeXY'].include? direcccion
		
		setNuevasCoordenadas(randx,randy)

		puts "#{self.class} #{@nombre} camino a la posicion #{@x},#{@y}"
	end

	def hablar(arrayObjetos)
		if estaAlcance?($rangoAlcance,elmasCercano?(arrayObjetos))
			puts "#{self.class} #{@nombre} dice BRAINNSS!!!"
		end
	end

end