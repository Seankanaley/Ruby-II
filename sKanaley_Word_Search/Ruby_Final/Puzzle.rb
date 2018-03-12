############################################################
#
# Name:        Sean Kanaley
# Assignment:  Word Search
# Date:        6/13/2017
# Class:       CIS 283
# Description: Code for creating a wordsearch puzzle based on a list of words provided via text file.
# Outputs in pdf format containing, puzzle, puzzle key and words to search for.
#
############################################################

class Puzzle
  attr_accessor :words, :row, :size

  def initialize(size, filename)
    @puzzle = []
    @size = size
    @puzzle_key
    @size.times do
      @row = Array.new(size, '.')
      @puzzle << @row
    end

    @words = []
    @word_list = File.open(filename)
    while !@word_list.eof?
      @words << @word_list.gets.chomp.upcase.delete(' ')
    end

    @word_list.close
    @words = @words.sort_by {|word| word.size}
    @words = @words.reverse!
  end

  def test_word(row, col, direction, word)

    continue = true

    case direction
      when "north"
        n = 0
        while n < word.size
          if inbounds(row - n, col)
            if @puzzle[row - n][col] != word[n] && @puzzle[row - n][col] !='.'
              continue = false
            end
          else
            continue = false
          end
          n += 1
        end

      when "north-east"
        n = 0
        while n < word.size
          if inbounds(row - n, col + n)
            if @puzzle[row - n][col + n] != word[n] && @puzzle[row - n][col] !='.'
              continue = false
            end

          else
            continue = false
          end
          n += 1
        end

      when "east"
        n = 0
        while n < word.size
          if inbounds(row, col + n)
            if @puzzle[row][col + n] != word[n] && @puzzle[row][col + n] !='.'
              continue = false
            end

          else
            continue = false
          end
          n += 1
        end

      when "south-east"
        n = 0
        while n < word.size
          if inbounds(row + n, col + n)
            if @puzzle[row + n][col + n] != word[n] && @puzzle[row + n][col + n] !='.'
              continue = false
            end

          else
            continue = false
          end
          n += 1
        end

      when "south"
        n = 0
        while n < word.size
          if inbounds(row + n, col)
            if @puzzle[row + n][col] != word[n] && @puzzle[row + n][col] !='.'
              continue = false
            end

          else
            continue = false
          end
          n += 1
        end

      when "south-west"
        n = 0
        while n < word.size
          if inbounds(row + n, col - n)
            if @puzzle[row + n][col - n] != word[n] && @puzzle[row + n][col - n] !='.'
              continue = false
            end

          else
            continue = false
          end
          n += 1
        end

      when "west"
        n = 0
        while n < word.size
          if inbounds(row, col - n)
            if @puzzle[row][col - n] != word[n] && @puzzle[row][col - n] !='.'
              continue = false
            end

          else
            continue = false
          end
          n += 1
        end

      when "north-west"
        n = 0
        while n < word.size
          if inbounds(row - n, col - n)
            if @puzzle[row - n][col - n] != word[n] && @puzzle[row - n][col - n] !='.'
              continue = false
            end

          else
            continue = false
          end
          n += 1
        end
    end
    return continue
  end

  def place_word(row, col, direction, word)

    case direction
      when "north"
        n = 0
        while n < word.size
          @puzzle[row - n][col] = word[n]
          n += 1
        end
      when "north-east"
        n = 0
        while n < word.size
          @puzzle[row - n][col + n] = word[n]
          n += 1
        end
      when "east"
        n = 0
        while n < word.size
          @puzzle[row][col + n] = word[n]
          n += 1
        end
      when "south-east"
        n = 0
        while n < word.size
          @puzzle[row + n][col + n] = word[n]
          n += 1
        end
      when "south"
        n = 0
        while n < word.size
          @puzzle[row + n][col] = word[n]
          n += 1
        end
      when "south-west"
        n = 0
        while n < word.size
          @puzzle[row + n][col - n] = word[n]
          n += 1
        end
      when "west"
        n = 0
        while n < word.size
          @puzzle[row][col - n] = word[n]
          n += 1
        end
      when "north-west"
        n = 0
        while n < word.size
          @puzzle[row - n][col - n] = word[n]
          n += 1
        end
    end
  end


  def puzzle_builder
    bearing = ["north", "north-east", "east", "south-east", "south", "south-west", "west", "north-west"]
    used = []
    @words.each do |word|
      placement = false
      until placement
        row = rand(0...@size)
        col = rand(0...@size)
        direction = bearing[rand(0...bearing.size)]

        if !(used).include?([row, col, direction]) #Didn't seem to improve my puzzle speed at all, alas I'm out of time.
          if test_word(row, col, direction, word)
            place_word(row, col, direction, word)
            placement = true
          end
        end
        used.push([row, col, direction])
      end
    end
    @puzzle_key = to_s
  end

  def fill_blanks
    x = 0
    y = 0
    word_string = @words.to_a.join
    characters = word_string.chars.to_a.uniq
    while inbounds(0 + x, 0 + y)
      if @puzzle[x][y] == '.'
        @puzzle[x][y] = characters.sample
      end
      x += 1
      if x >= @puzzle.size
        x = 0
        y += 1
      end
    end
  end


  def inbounds(row, col)
    return (
    row < @size &&
        row >= 0 &&
        col < @size &&
        col >= 0)
  end

  def print_key
    output = ' '
    @puzzle.each do |row|
      output += row.join(' ') + "\n"
    end
    return output
  end


  def to_s
    output = ''
    @puzzle.each do |row|
      output += row.join(' ') + "\n"
    end
    return output
  end

  def list_words
    line_width = 90
    output = ""
    @words.each_with_index do |word, index|
      output += "#{index + 1}.".ljust(3) + " #{word}".ljust(line_width / 3)
    end
    return output
  end


  def create_pdf(filename)
    Prawn::Document.generate("#{filename}.pdf") do |pdf|

      pdf.move_down 5

      pdf.font "Courier", :size => 25, :style => :bold
      pdf.text "Word Search", :align => :center

      pdf.move_down 5

      pdf.font "Courier", :size => 10
      pdf.text "#{to_s}", :align => :center;

      pdf.move_down 5

      pdf.font "Courier", :size => 15
      pdf.text "Find the following #{words.count} words:", :align => :center

      pdf.move_down 5

      pdf.font "Courier", :size => 10
      pdf.text "#{list_words}"

      pdf.start_new_page

      pdf.move_down 5

      pdf.font "Courier", :size => 25, :style => :bold
      pdf.text "Word Search KEY", :align => :center

      pdf.move_down 5

      pdf.font "Courier", :size => 10
      pdf.text "#{@puzzle_key}", :align => :center;

      pdf.move_down 5

      pdf.font "Courier", :size => 15
      pdf.text "Find the following #{words.count} words:", :align => :center

      pdf.move_down 5

      pdf.font "Courier", :size => 10
      pdf.text "#{list_words}"


    end
  end
end