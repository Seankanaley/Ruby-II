############################################################
#
# Name:        Sean Kanaley
# Assignment:  Character Play Off
# Date:        5/17/2017
# Class:       CIS 283
# Description: Character Class containing
# Attributes:	Name, Race,
#     -Hit Points (Max 100),
#     -Current hit points (calculated)
#     -Strength (Max 50),
#     -Agility (Max 10),
#     -Weapon,   (object from the Weapon Class)
#     -Armor  (object from the Armor Class)
#     -Methods:	to_s – to print out details about the character
#     -current_status   - print out the current status of this character
#     -revive_character – resets character's current_hits to original hits
#     -reduce_hits   (removes some # of hits from the character)
############################################################


class Character
  attr_accessor :name, :race, :hit_points, :current_hit_points, :strength, :agility, :weapon, :armor
  def initialize(name, race, hit_points, strength, agility, weapon, armor)
    @name = name
    @race = race
    @weapon = weapon
    @armor = armor
    if (hit_points > 100)
      @hit_points = 100
    elsif  (hit_points < 0)
      @hit_points = 0
    else
      @hit_points = hit_points
    end
    @current_hit_points = hit_points
    if (strength > 50)
      @strength = 50
    elsif (strength < 0)
      @strength = 0
    else
      @strength = strength
    end
    if (agility > 10)
      @agility = 10
    elsif (agility < 0)
      @agility = 0
    else
      @agility = agility
    end
  end

  def to_s
    return "#{@name} the #{@race} is bearing an #{@weapon} and wearing #{@armor}"
  end

  def current_status
    return "#{@name} has #{@current_hit_points} left out of #{@hit_points} hit points"
  end

  def revive_character
    return @current_hit_points = hit_points
  end

  def reduce_hits(damage)
    if (@current_hit_points - damage > 0)
      @current_hit_points -= damage
    else
      @current_hit_points = 0
    end
  end

  def fight_string
    return "#{@name} fights with the #{@weapon.name}: "
  end

  def agility_roll
    dAgility = Dice.new(@agility)
    agility_roll = dAgility.roll
    return agility_roll
  end
end