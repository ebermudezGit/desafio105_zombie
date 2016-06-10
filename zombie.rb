class Zombie
	$max_x=10
	$max_y=10
	$direcciones=['ejeX','ejeY','ejeXY']

	attr_accessor :nombre,:x,:y

	def initialize(nombre="unname", x = rand(1..10), y = rand(1..10))
		@nombre=nombre
		@x=x
		@y=y
	end

	def caminar
		randy=0
		randx=0
		
		puts direcccion = $direcciones.sample
		if direcccion.in?(['ejeX','ejeXY'])
			randx=[-1,1].sample
		end
		if direcccion.in?(['ejeY','ejeXY'])
			randy=[-1,1].sample
		end

		@x=@x+randy
		@y=@y+randy
	end

	def hablar(arrayObjetos)
		if estaCerca?(masCercano?(arrayObjetos))
			'BRAINNSS!!!'
		end
	end

	def info
		puts "#{self.class} #{@nombre} pos: #{@x},#{@y}"
	end

	def estaCerca?(objMasCercano)
		true
	end

	def masCercano?(arrayObjetos)
		objMasCercano = 0
	end

end