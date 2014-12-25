


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
 DEFAULT_ROOM_NAME = "Unkown room"
 DEFAULT_ROOM_DESCRIPTION = "A mysterious place"
 DEFAULT_MONSTER = "There is no enemy in here"
 def initialize(name = {}, description = {}, monster = {})
   @name = name.fetch(:roomname, DEFAULT_ROOM_NAME)
   @description = description.fetch(:roomdescription, DEFAULT_ROOM_DESCRIPTION)
   @monster = monster.fetch(:monster, DEFAULT_MONSTER)
 end

 def place_monster! (monster)
   @monster = monster
 end
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

module Weapon
  attr_accessor :deadliness
  attr_accessor :power
end

class Sword < Treasure
  @@num_things -=1
  include Weapon
  attr_accessor :name

  def initialize(name, description, value)
    super(name, description, value)
  end
end

class User < Thing

  @lives = 10

  def initialize(name, description, lives)
    super(name, description)
    @lives = lives
  end

  def lives (player)
    if monster :hit == true then
      lives -=1
    end
  end

  def get_treasure! (treasure)
    @treasure = treasure
  end

  def enter_room! (room)
    @room = room
  end
end

class Monster < Thing
  def initialize (name, description, damage)
    super(name, description)
    @damage = damage
  end

  def hit! (player)
    @lives =- 1 
  end
end

newPlayer = User.new("Hannah", "a gallient hero", 10)

t1 = Treasure.new("Excaliber", "an Elvish weapon forged of gold", 800)
t2 = Treasure.new("Dragon Horde", "a huge pile of jeweles", 550)

sword = Sword.new("Excaliber", "an Elvish weapon forged of gold", 800)
sword.deadliness = 10
sword.power = 20

t1 = sword

monster1 = Monster.new("Ork", "a short, ugly little fella", 30)

room1 = Room.new({:roomname => "Crystal Grotto"}, {:roomdescription => "A glittery cavern"}, {:monster => monster1})
room2 = Room.new({:roomname => "Dark Cave"},  {:roomdescription => "A gloomy hole in the rocks"})
room3 = Room.new({:roomname => "Forest Glade"}, {:roomdescription => "A verdant clearing filled with shimmering light"})
room4 = Room.new
#intiliazes a map with the rooms just created
mymap = Map.new([room1, room2, room3])



puts
puts "This is your new player: #{newPlayer.name}, #{newPlayer.description}"
puts

puts "Treasure1 is #{t1.to_s} with the value:#{t1.value}"
# puts "Treasure2 is #{t2.to_s} with the value:#{t2.value}"
puts
puts
newPlayer.get_treasure!(sword)
puts "The Player should now have the sword: #{newPlayer.inspect}"
puts
puts "Your sword is #{sword.name}, #{sword.description}. It is worth #{sword.value} rupees, has level #{sword.deadliness} deadliness and #{sword.power} power"
# change the description of the sword to be tarnished
puts 
newPlayer.enter_room!(room1)
puts "The Player should now have entered room1 and there should be a monster initialized in it: #{newPlayer.inspect}"
puts
room1
puts "monster1 is initialized into room1: #{monster1.inspect}"
#really want to initialize room with monster in it
# need to create monster to tarnish sword
t1.description << " [now somewhat tarnished]"
puts "Treasure1 is #{t1.description}"
puts
puts "room1 name= #{room1.name}, description= #{room1.description}" 
puts "room2 name= #{room2.name}, description= #{room2.description}" 
puts "room3 name= #{room3.name}, description= #{room3.description}" 
puts
puts "Since room4 is unknown to the finder its name defaults to #{room4.name} and its description defaults to #{room4.description}"
puts
puts ( t1.show_classvars )
puts ( mymap.room_count ) #unknown rooms cannot be seen on map

