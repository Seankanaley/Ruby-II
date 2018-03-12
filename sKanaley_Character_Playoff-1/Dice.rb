############################################################
#
# Name:        Sean Kanaley
# Assignment:  Character Play Off
# Date:        5/17/2017
# Class:       CIS 283
# Description: A Dice class containing
#     -Dice Class
#     -Attributes:	sides_of_die
#     -Methods:	initialize(  num_sides )
#     -roll  (returns a random number between 1 and num_sides )
############################################################


class Dice
  def initialize(num_sides)
    @num_sides = num_sides
  end

  def roll
    return rand(1..@num_sides)
  end
end