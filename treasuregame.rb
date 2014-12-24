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
    return "(Thing.to_s):: The #{@name} Thing is #{@description}"
  end

  def show_classvars
    return "There are #{@@num_things} Thing objects in this game"
  end
 
end

class Room < Thing

end

class Map

  def initialize( someRooms )
    @rooms = someRooms
  end

  def to_s
    @rooms.each {|a_room| puts a_room}
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

t1 = Treasure.new("Sword", "am Elvish weapon forged of gold", 800)
t2 = Treasure.new("Dragon Horde", "a huge pile of jeweles", 550)

room1 = Room.new("Crystal Grotto", "A glittery cavern")
room2 = Room.new("Dark Cace", "A gloomy hole in the rocks")
room3 = Room.new("Forest Glade", "A verdant clearing filled with shimmering light")
#intiliazes a map with the rooms just created
mymap = Map.new([room1, room2, room3])

puts "This is the treasure1: #{t1.inspect}"
puts "This is the treasure2: #{t2.inspect}"

puts "Treasure2 is #{t2.to_s}"

puts "t1 name = #{t1.name}, description = #{t1.description}, value = #{t1.value}"
# change the description of the sword to be tarnished
t1.description << " now somewhat tarnished"
puts "Treasure1 is #{t1.description}"

puts "room1 name=#{room1.name}, description=#{room1.description}" 
puts ( t1.show_classvars )
