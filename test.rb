require './zombie'
require './persona'
#require './individuo'

zombie=Zombie.new('zommud',4,5)
persona=Persona.new('Enrique',6,4)
#personas=[persona]
#zombies=[zombie]
personas = Array.new(6){Persona.new()}
zombies = Array.new(4){Zombie.new()}

puts zombie.distancia?(4,4,4,4)

zombie.info
persona.info
zombie.hablar(personas)
persona.gritar(zombies)

zombie.caminar
persona.correr
zombie.info
persona.info
zombie.hablar(personas)
persona.gritar(zombies)
