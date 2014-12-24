


class Thing
  @@num_things=0 #class variable

  attr_reader :description, :name
  attr_writer :description

  def initialize(name, description)

    @name = name
    @description = description
    @@num_things +=1 #increment @@num_things
  end

  def to_s #override default to_s method
    return "The #{@name} and is #{@description}"
  end

  def show_classvars
    return "There are #{@@num_things} Thing objects in this game"
  end
 
end

class Room < Thing

end

class Map 
 @@room_count = 0

  def initialize( someRooms )
    @rooms = someRooms
    @@room_count=someRooms.count
  end

  def to_s
    @rooms.each {|a_room| puts a_room}
  end

  def room_count
    return "There are now #{@@room_count} rooms in the map"
  end
end

class Treasure < Thing
  attr_reader :value
  attr_writer :value

  def initialize(name, description, value)
    super(name, description)
    @value = value 
  end

end

class Weapon
  attr_accessor :deadliness
  attr_accessor :power

  def initialize(deadliness, power)
    @power = power
    @deadliness = deadliness
  end
end

class Sword < Weapon

  attr_accessor :name

  def initialize(name, deadliness, power)
    super(deadliness, power)
    @name = name
  end
end

t1 = Treasure.new("Sword", "am Elvish weapon forged of gold", 800)
t2 = Treasure.new("Dragon Horde", "a huge pile of jeweles", 550)

sword = Sword.new("Excaliber", 10, 20)

room1 = Room.new("Crystal Grotto", "A glittery cavern")
room2 = Room.new("Dark Cace", "A gloomy hole in the rocks")
room3 = Room.new("Forest Glade", "A verdant clearing filled with shimmering light")
#intiliazes a map with the rooms just created
mymap = Map.new([room1, room2, room3])

puts
puts "This is the Treasure1: #{t1.inspect}"
puts "This is the Treasure2: #{t2.inspect}"
puts
puts "Treasure1 is #{t1.to_s} with the value:#{t1.value}"
puts "Treasure2 is #{t2.to_s} with the value:#{t2.value}"
puts
puts "Your sword is #{sword.name}, with level #{sword.deadliness} deadliness and has #{sword.power} power"
puts
# change the description of the sword to be tarnished
t1.description << " [now somewhat tarnished]"
puts "Treasure1 is #{t1.description}"
puts
puts "room1 name= #{room1.name}, description= #{room1.description}" 
puts "room2 name= #{room2.name}, description= #{room2.description}" 
puts "room3 name= #{room3.name}, description= #{room3.description}" 
puts
puts ( t1.show_classvars )
puts ( mymap.room_count )
