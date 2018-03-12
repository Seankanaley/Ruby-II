############################################################
#
# Name:        Sean Kanaley
# Assignment:  Character Play Off
# Date:        5/17/2017
# Class:       CIS 283
# Description: Item Class and subclasses
#     -Item Class
#     -Attributes:	name
#
#     -Weapons Class - which inherits from Item class
#     -Attributes:	damage_hits
#     -Methods:	to_s
#
#     -Armor Class - which inherits from Item class
#     -Attributes:	protection_hits
#     -Methods:	to_s
############################################################

class Item
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

class Weapon < Item
  attr_reader :damage_hits
  def initialize(name, damage_hits)
    super(name)
    @damage_hits = damage_hits
  end
  def to_s
    return "#{@name} that hits for #{@damage_hits} points of damage"
  end
end

class Armor < Item
  attr_reader :protection_hits
  def initialize(name, protection_hits)
    super(name)
    @protection_hits = protection_hits
  end
  def to_s
    return "#{@name} that protects against #{@protection_hits} points of damage"
  end
end