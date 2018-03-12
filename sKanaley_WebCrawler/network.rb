############################################################
#
# Name:        Sean Kanaley
# Assignment:
# Date:        5/31/2017
# Class:       CIS 283
# Description: A simple web crawler based on website entered in the terminal, parses the html code for all links found, stores the link and link value in a new link object.
# Tests the link object's link property to see whether it's internal or external and recreating links as needed, tests and stores the response code of each link.
# Creates a PDF based on the website, with website, number of links and outputs the link objects sorted by Valid Links, Redirected Links and Invalid Links.
#
############################################################


require 'net/https'
require 'prawn'
require_relative 'link'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

website = ARGV[0]
link_To_Check = LinkChecker.new(website)

 puts website
# puts ARGV.inspect
response = Net::HTTP.get_response(website, '/')

html = response.body #Puts html code from website path
links = html.scan(/<a.*?\/a>/)
#puts links
# puts links.count

 links.each do |item|
  item.scan(/href="(.+?)".*>(.+?)<\/a/)
   link = Link.new($1, $2)
   link_To_Check.add_link(link)
   link.check_link($1)
   puts "#{link.link} checked"
 end


Prawn::Document.generate("#{website}.pdf") do
  move_down 20
  font "Times-Roman", :size => 40
  text "#{website}", :align => :center

  move_down 5
  font "Times-Roman", :size => 20
  text "Number of links: #{link_To_Check.link_count}", :align => :center

  move_down 5
  font "Times-Roman", :size => 20
  text "Valid URL's"

  move_down 20
  font "Times-Roman", :size => 16
  text "#{link_To_Check.valid_links}".encode("Windows-1252", "UTF-8", invalid: :replace, undef: :replace), :inline_format => true


  move_down 20
  font "Times-Roman", :size => 20
  text "Redirected URL's"

  move_down 20
  font "Times-Roman", :size => 16
  text "#{link_To_Check.redirected_links}".encode("Windows-1252", "UTF-8", invalid: :replace, undef: :replace), :inline_format => true

  move_down 20
  font "Times-Roman", :size => 20
  text "Invalid URL's"

  move_down 20
  font "Times-Roman", :size => 16
  text "#{link_To_Check.invalid_links}".encode("Windows-1252", "UTF-8", invalid: :replace, undef: :replace), :inline_format => true

end

