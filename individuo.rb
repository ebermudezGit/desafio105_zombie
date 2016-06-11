class Individuo

	$min_x=1
	$min_y=1
	$max_x=10
	$max_y=10
	$direcciones=['ejeX','ejeY','ejeXY']
	$randNombre=['Juan','Enrique','Enrique2','Perengano','Mengano','Ruben',"Gssd","Chona","Tita"]
	$rangoAlcance=3
	$rangoMuerte=1

	attr_accessor :nombre,:x,:y
	attr_reader :muerto,:items

	def initialize(nombre=$randNombre.sample+rand(100).to_s, x = rand(1..10),y = rand(1..10))
		@nombre=nombre
		@x=x
		@y=y
		@muerto=0
		@items=[]
	end

	def info
		puts "#{self.class} #{@nombre} posicion Actual: #{@x},#{@y}"
	end

	def estaAlcance?(rangoAlcance,objMasCercano)

		return false if objMasCercano==nil or rangoAlcance==nil
		
		return false if distancia?(@x,@y,objMasCercano.x,objMasCercano.y)>rangoAlcance

		true
	end

	def reglaDistanciaXY
		if $direcciones.include? 'ejeXY'
			-1
		else
			0
		end
	end

	def distancia?(x1,y1,x2,y2)
		sumX=0,sumY=0,distancia = reglaDistanciaXY
		sumX=(x1-x2).abs
		sumY=(y1-y2).abs

		sumX==sumY && sumY==0 ? 0 : sumX==sumY ? distancia+sumX+1 : sumX+sumY
	end

	def elmasCercano?(arrayObjetos)

		return nil if arrayObjetos == nil

		distanciaMin=nil;objetoMin=nil

		arrayObjetos.each do |objeto|
			next if objeto == nil

			next if objeto.class==self.class or ['Zombie','Persona'].include? self.class
			
			distancia=distancia?(@x,@y,objeto.x,objeto.y)

			if distanciaMin==nil
				distanciaMin=distancia;				objetoMin=objeto 
			end

			if distancia<distanciaMin
				distanciaMin=distancia;				objetoMin=objeto 
			end
		end
		objetoMin
	end

	def muere?(arrayObjetos)
		objMasCercano=elmasCercano?(arrayObjetos)
		return false if objMasCercano==nil
		
		if distancia?(@x,@y,objMasCercano.x,objMasCercano.y)<= $rangoMuerte
			@muerto=1
			return true	
		end
		false
	end

	def validaLimiteX(randx)
		if @x+randx<$min_x
			randx=@x-$min_x
		elsif @x+randx>$max_x
			randx=$max_x-@x
		end

		randx
	end
	
	def validaLimiteY(randy)
		if @y+randy<$min_y
			randy=@y-$min_y
		elsif @y+randy>$max_y
			randy=$max_y-@y
		end
		randy
	end

	def setNuevasCoordenadas(randx,randy)
		@x+=validaLimiteX(randx)
		@y+=validaLimiteY(randy)
	end

end