class Individuo

	$min_x=1
	$min_y=1
	$max_x=10
	$max_y=10
	$direcciones=['ejeX','ejeY','ejeXY']
	$randNombre=['Juan','Enrique','Enrique2','Perengano','Mengano','Ruben']
	$rangoAlcance=3
	$rangoMuerte=1

	attr_accessor :nombre,:x,:y
	attr_reader :muerto

	def initialize(nombre=$randNombre.sample, x = rand(1..10),y = rand(1..10))
		@nombre=nombre
		@x=x
		@y=y
		@muerto=0
	end

	def info
		puts "#{self.class} #{@nombre} pos: #{@x},#{@y}"
	end

	def estaAlcance?(rangoAlcance,objMasCercano)
		if objMasCercano==nil or rangoAlcance==nil
			return false
		end
		
		if distancia?(@x,@y,objMasCercano.x,objMasCercano.y)>rangoAlcance
			return false
		end
		true
	end

	def distancia?(x1,y1,x2,y2)
		sumX=0,sumY=0,distancia = -1
		sumX=(x1-x2).abs
		sumY=(y1-y2).abs

		if sumX==sumY
			distancia=sumX+1
		else
			distancia=sumX+sumY
		end

		return distancia
	end

	#Arreglo de Objetos devuelve el mas Cercano
	def elmasCercano?(arrayObjetos)
		if arrayObjetos == nil
			return nil
		end

		distanciaMin=nil
		objetoMin=nil

		arrayObjetos.each do |objeto|
			if objeto == nil
				next
			end

			if objeto.class==self.class or ['Zombie','Persona'].include? self.class
				next
			end
			
			distancia=distancia?(@x,@y,objeto.x,objeto.y)

			if distanciaMin==nil
				distanciaMin=distancia
				objetoMin=objeto
			end

			if distancia<distanciaMin
				distanciaMin=distancia
				objetoMin=objeto
			end
		end

		return objetoMin
	end

	def muere?(arrayObjetos)
		objMasCercano=elmasCercano?(arrayObjetos)
		
		if objMasCercano==nil or rangoAlcance==nil
			return false
		end
		
		if distancia?(@x,@y,objMasCercano.x,objMasCercano.y)<= $rangoMuerte
			@muerto=1
			return true	
		end
		false
	end

end