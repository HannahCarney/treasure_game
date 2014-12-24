class Thing
  @@num_things=0 #class variable

  attr_reader :description, :name
  attr_writer :description

  def initialize(name, description)

    @name = name
    @description = description
    @@num_things +=1 #increment @@num_things
  end

  def to_s #override default to_s methog
    return "(Thing.to_s):: The #{@name} Thing is 3{@description}"
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

mymap = Map.new([room1, room2, room3])