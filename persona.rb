require './individuo'
class Persona < Individuo

	def correr
		randy=0;randx=0
		
		direcccion = $direcciones.sample

		randx=[-2,2].sample if ['ejeX','ejeXY'].include? direcccion
		
		randy=[-2,2].sample if ['ejeY','ejeXY'].include? direcccion

		setNuevasCoordenadas(randx,randy)
		
		puts "#{self.class} #{@nombre} corrio a la posicion #{@x},#{@y}"
	end

	def gritar(arrayObjetos)
		if enPeligro?($rangoAlcance,elmasCercano?(arrayObjetos))
			puts "#{self.class} #{@nombre} grita ahhhhhhhhhhh ahhhhhhhhhh ahhhhhhhhhh!!!"
		end
	end

	def enPeligro?(rangoAlcance,objMasCercano)
		estaAlcance?(rangoAlcance,objMasCercano)
	end

end