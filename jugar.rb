require './procesos'
require './zombie'
require './persona'

maximoCiclos=20
numZombies = 1
numPersonas = 9

@personas = Array.new(numPersonas){Persona.new()}
@zombies = Array.new(numZombies){Zombie.new()}

puts "Se inicia la simulacion con #{numZombies} zombies y #{numPersonas} Personas"


#individuo.info
#individuo.hablar(personas)
#individuo.gritar(zombies)
#individuo.caminar
#individuo.correr
def limpiarArregloPersonas
	@personas.select{ |persona| persona.muerto==1 }.each do	|persona|
		@zombies << Zombie.new(persona.nombre,persona.x,persona.y)
	end
	@personas=@personas.delete_if { |persona| persona.muerto==1 }
end
def limpiarArregloZombie
	@zombies=@zombies.delete_if { |zombie| zombie.muerto==1 }
end

def turnoPersonas
	@personas.each_with_index do |persona,index|
		persona.muere?(@zombies)
		if persona.muerto==1
			persona.gritar(@zombies)
			puts "La persona #{persona.nombre} fue mordida por un zombie y a Muerto!!"
			next
		end
		persona.correr
		persona.gritar(@zombies)
	end

	limpiarArregloPersonas

end

def turnoZombies
	@zombies.each_with_index do |zombie,index|
		zombie.muere?(@zombies)
		if zombie.muerto==1
			puts "La zombie #{zombie.nombre} fue atacado por una Persona y a Muerto!!"
			next
		end
		zombie.caminar
		zombie.hablar(@personas)		
	end
	limpiarArregloZombie
end

def procesos
	turnoPersonas
	turnoZombies
end

@personas.each{ |persona| persona.info }
@zombies.each{ |zombie| zombie.info }
puts

ronda = 1
while @personas.length>0 and @zombies.length>0 and ronda<=maximoCiclos
	puts "Ronda #{ronda}"
	puts "=================================================="
	
	procesos

	puts "=================================================="
	puts "Fin de Ronda #{ronda}"
	puts
	ronda+=1
end

if @personas.length==0
	puts "Ganan los Zombies"
elsif @zombies.length==0
	puts "Ganan las Personas"
else
	puts "Se agotaron las rondas"
end
puts "Total de Zombies #{@zombies.length} total personas #{@personas.length}"
	
