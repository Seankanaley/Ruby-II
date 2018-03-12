############################################################
#
# Name:        Sean Kanaley
# Assignment:  Word Search
# Date:        6/13/2017
# Class:       CIS 283
# Description: Main program for a wordsearch puzzle creator, runs with timer to calculate average time to execute code.
#
############################################################

require_relative "Puzzle"
require "prawn"
require "benchmark"

puts "Enter the size of the puzzle you'd like to make (num entered * num entered)"
user_size = gets.chomp.to_i

puts "Enter the name of the file containing your list of words"
file_name = gets.chomp

puts "How many times do you want to run the program?"
user_times = gets.chomp.to_i

def time_it(num_times=1, user_size, file_name)
  start = Time.now
  num_times.times do
    puzzle = Puzzle.new(user_size, "#{file_name}.txt")
    puzzle.print_key
    puzzle.list_words
    puzzle.puzzle_builder
    puzzle.fill_blanks
    puzzle.list_words
    puts puzzle.create_pdf(file_name)
  end
  puts "Your code took #{(Time.now - start) / num_times} seconds on average to run"
end

time_it(user_times, user_size, file_name)






