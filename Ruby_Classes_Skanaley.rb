############################################################
#
# Name:        Sean Kanaley
# Assignment:  Ruby Classes
# Date:        4/21/2017
# Class:       CIS 283
# Description: Create a program which implements Ruby Classes to store object information.
#
############################################################


class Person
  def initialize(first_name, last_name, age, hair_color, eye_color)
    @first_name = first_name
    @last_name = last_name
    @age = age
    @hair_color = hair_color
    @eye_color = eye_color
  end

  def first_name
    return @first_name
  end

  def last_name
    return @last_name
  end

  def age
    return @age
  end

  def hair_color
    return @hair_color
  end

  def eye_color
    return @eye_color
  end

  def first_name= (new_first)
    @first_name = new_first
  end

  def last_name= (new_last)
    @last_name = new_last
  end

  def age= (new_age)
    @age = new_age
  end

  def hair_color= (new_hair_color)
    @hair_color = new_hair_color
  end

  def eye_color= (new_eye_color)
    @eye_color = new_eye_color
  end

  def to_s
    return "First Name: #{@first_name}, Last Name: #{@last_name}, Age: #{@age}, Hair Color: #{@hair_color}, Eye Color: #{@eye_color}"
  end

end

class Address
  def initialize(line_1, line_2, city, state, zip)
    @line_1 = line_1
    @line_2 = line_2
    @city = city
    @state = state
    @zip = zip
  end

  def line_1
    return @line_1
  end

  def line_2
    return @line_2
  end

  def city
    return @city
  end

  def state
    return @state
  end

  def zip
    return @zip
  end

  def line_1= (new_line_1)
    @line_1 = new_line_1
  end

  def line_2= (new_line_2)
    @line_2 = new_line_2
  end

  def city= (new_city)
    @city = new_city
  end

  def state= (new_state)
    @state = new_state
  end

  def zip= (new_zip)
    @zip = new_zip
  end

  def to_s
  return "Address: \n #{@line_1}, #{@line_2}\n #{@city}, #{@state}, #{@zip}"
  end
end

class Character
  def initialize(name, race, hit_points, gold)
    @name = name
    @race = race
    @hit_points = hit_points
    @gold = gold
    @weapons = []
    @clothing = []
  end

  def name
    return @name
  end

  def race
    return @race
  end

  def hit_points
    return @hit_points
  end

  def gold
    return @gold
  end

  def name= (new_name)
    @name = new_name
  end

  def race= (new_race)
    @race = new_race
  end

  def hit_points= (new_hit_points)
    @hit_points = new_hit_points
  end

  def gold= (new_gold)
    @gold = new_gold
  end

  def add_weapon( weapon_name )
    @weapons << weapon_name
  end

  def drop_weapon ( weapon_name)
    @weapons.delete(weapon_name)
  end

  def add_clothing( item )
    @clothing << item
  end

  def drop_clothing ( item )
    @clothing.delete(item)
  end

  def to_s
    return "#{@name} is a #{@race} with #{@hit_points} hit points. They currently have #{@gold} gold. Their items contain #{@weapons} equipped for weapons and are wearing #{@clothing}"
  end

end

player = Person.new( "Jack", "Gilford", 43, "Brown", "Blue"  )
player_address = Address.new( "872", "Linwood Lane", "Spokane", "WA", "99207" )
player_character = Character.new( "Findabar Fersnappencloitz", "Human", 225, 500)

puts player.inspect
puts player

puts
puts player.first_name
puts player.last_name
puts player.age
puts player.hair_color
puts player.eye_color

puts
player.first_name = "Andrew"
player.last_name = "McCayless"
player.age = "23"
player.hair_color = "Black"
player.eye_color = "Green"
puts player

puts
puts player_address.inspect
puts player_address

puts
puts player_address.line_1
puts player_address.line_2
puts player_address.city
puts player_address.state
puts player_address.zip

puts
player_address.line_1 = "508"
player_address.line_2 = "West Babylon"
player_address.city = "New York"
player_address.state = "NY"
player_address.zip = "11702"
puts player_address
puts
puts player_character.inspect
puts player_character

puts
puts player_character.name = "Bingleflap McSnarflebip"
puts player_character.race = "Dark Elf"
puts player_character.hit_points = "275"
puts player_character.gold = "722"
puts player_character

puts
player_character.add_weapon("Gnarled Branch")
player_character.add_weapon("Short Sword")
player_character.add_weapon("Crossbow")
player_character.add_clothing("Leather Jerkin")
player_character.add_clothing("Leather Gloves")
player_character.add_clothing("Leather Boots")
player_character.add_clothing("Red Bandana")
player_character.add_clothing("Linen Shirt")
player_character.add_clothing("Linen Pants")
puts player_character.inspect
puts player_character

puts
player_character.drop_clothing( "Red Bandana")
player_character.drop_weapon( "Gnarled Branch")
puts player_character


