############################################################
#
# Name:        Sean Kanaley
# Assignment:  Character Play Off
# Date:        5/17/2017
# Class:       CIS 283
# Description: Create a game that will allow 2 different fictional characters to face off against each other in a simulated environment.
############################################################


require_relative('Character')
require_relative('Dice')
require_relative('Item')


user_menu = [
    "Load Character 1",
    "Load Character 2",
    "Fight",
    "Quit"
]

dice = [
    Dice.new(4),
    Dice.new(8),
    Dice.new(10),
    Dice.new(15)
]


def menu(menu_items, prompt)
  menu_items.each_with_index do | item, item_number |
    puts "#{item_number + 1}. #{item}"
  end
  print prompt
  user_choice = gets.to_i
  return user_choice
end

def load_character(file_name)
  character_file = File.open(file_name, 'r')
  character_line = character_file.gets.chomp.split(',')
  weapon_line = character_file.gets.chomp.split(',')
  armor_line = character_file.gets.chomp.split(',')
  character_file.close

  weapon = Weapon.new(weapon_line[0], weapon_line[1].to_i)
  armor = Armor.new(armor_line[0], armor_line[1].to_i)
  return character = Character.new(
      character_line[0],
      character_line[1],
      character_line[2].to_i,
      character_line[3].to_i,
      character_line[4].to_i,
      weapon,
      armor
  )
end

  def fight(char1, char2, dice)
    puts char1.fight_string
    if(dice[2].roll < char1.agility)
      hit = (char1.strength * (1.0/dice[0].roll) + (char1.weapon.damage_hits/dice[1].roll)).to_i
      soak =(char2.armor.protection_hits/dice[3].roll).to_i
      damage = (hit - soak)
      if damage < 0
        damage = 0
      end
      char2.reduce_hits(damage)
      puts "\tHit: #{hit}   #{char2.name}'s armor saved #{soak} points\n\t#{char2.name}'s hits are reduced by #{damage} points"
      puts "\t#{char2.current_status}"
    else
      puts "\t\tMisses!"
    end
      puts
  end

def duel(char1, char2, dice)
  #Loop until Dead
  while char1.current_hit_points > 0 && char2.current_hit_points > 0
      #Roll Agility and compare to determine who goes first
      dAgileChar1 = char1.agility_roll
      dAgileChar2 = char2.agility_roll
      if(dAgileChar1> dAgileChar2)
        fight(char1, char2, dice)
        unless char1.current_hit_points == 0 || char2.current_hit_points == 0
        fight(char2, char1, dice)
        end
      else
        fight(char2, char1, dice)
        unless char1.current_hit_points == 0 || char2.current_hit_points == 0
        fight(char1, char2, dice)
        end
      end
    print "Press Enter to continue"
    gets
  end
  if char1.current_hit_points == 0
    puts
    puts "#{char2.name} WINS!"
    puts "-------------------------"
  else
    puts
    puts "#{char1.name} WINS!"
    puts "-------------------------"
  end
  puts char1.current_status
  puts char2.current_status
  puts "-------------------------"
  puts
end


while user_choice = menu(user_menu, "\nPlease make a selection: ")
  case user_choice
    when 1
      puts "Enter a character name you'd like to see fight"
      char_choice = gets.chomp.downcase
      character1 = load_character("#{char_choice}.txt")

    when 2
     puts "Enter a character name you'd like to see fight"
     char_choice = gets.chomp.downcase
      character2 = load_character("#{char_choice}.txt")
    when 3
      character1.revive_character
      character2.revive_character
      duel(character1, character2, dice)

    when 4
      abort("Exiting")
  end
end
