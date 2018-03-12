############################################################
#
# Name:        Sean Kanaley
# Assignment:  Text Search with Regular Expressions
# Date:        4/12/2017
# Class:       CIS 283
# Description: Write a program that will search through a data file using regular expressions.
#
############################################################

enrollment_file = File.open("Enrollment.txt")
class_catalog = []
while !enrollment_file.eof?
  class_catalog << enrollment_file.gets.chomp
end

enrollment_file.close

dpt_name = ''
counter = 1

while dpt_name != "EXIT"

      print "Please enter the department (CIS, EN, ACCT etc.) you're looking for or type Exit to stop: "
      dpt_name = gets.chomp.upcase
      if dpt_name == 'EXIT'
        abort("Exiting")
      end

      print "Please enter the class number you are looking for: "
      class_num = gets.chomp

      class_catalog.each_with_index do |line, index|
        if line =~ /#{dpt_name}\s+#{class_num}/
          puts line
            if class_catalog[index + 1] =~ /\s{11}\S/ || class_catalog[index + 1] =~ /\s{58}\S/
              puts class_catalog[index + 1]
              counter += 1
              has_next_line = true
              while has_next_line
                if class_catalog[index + counter] =~ /\s{11}\S/ || class_catalog[index + counter] =~ /\s{58}\S/
                  puts class_catalog[index + counter]
                  counter += 1
                  has_next_line = true
                else
                  has_next_line = false
                end
              end
            end
        end
      end
end