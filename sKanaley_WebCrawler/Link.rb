############################################################
#
# Name:        Sean Kanaley
# Assignment:
# Date:        5/31/2017
# Class:       CIS 283
# Description: Class for storing ling objects, and a class for a link array and methods for output.
#
############################################################

class LinkChecker
  def initialize(url)
    @links_array = []
    @@base_url = url
  end

  def base_url
    return @@base_url
  end

  def set_base_url=(base_url)
    @@base_url = base_url
  end

  def add_link(link)
    @links_array << link
  end

  def link_count
    return @links_array.count
  end



  def valid_links
    link_to_put = ""
    @links_array.each do |link|
      if link.code == "200"
        link_to_put += "#{link}\n\n"
      end
    end
    return link_to_put
  end

  def redirected_links
    link_to_put = ""
    @links_array.each do |link|
      if link.code == "301" || link.code == "302"
        link_to_put += "#{link}\n\n"
      end
    end
    return link_to_put
  end

  def invalid_links
    link_to_put = ""
    @links_array.each do |link|
      if link.code == "404"
        link_to_put += "#{link}\n\n"
      end
    end
    return link_to_put
  end




end

class Link < LinkChecker
  attr_accessor :link, :click_value, :link_type, :code
  def initialize(link, click_value)
    @link = link
    @click_value = click_value
    @link_type = link_type
    @code = code

    # case @link
    #
    #   when /\A\/\//
    #     response = Net::HTTP.get_response( URI("https:#{@link}"))
    #     @code = response.code
    #     puts @code
    #   when /\A\/\w/
    #       response = Net::HTTP.get_response( URI("https://#{@@base_url}#{@link}"))
    #     @code = response.code
    #       puts @code
    #   when nil
    #     @code = "404"
    #     puts @code
    #   when '#'
    #     @code = "200"
    #     puts @code
    #   else
    #     response = Net::HTTP.get_response(URI(@link))
    #     @code = response.code
    #     puts @code
    # end
  end

  def to_s
    #return "<c:alink uri=" + "#{@link}>#{@click_value}" + "</c:alink>"
    return "<color rgb='0645AD'>#{@link}</color>, <color rgb='FF4500'>#{@click_value}</color>, Code: #{@code}, #{@link_type}"
  end

  def check_link(url)
    case url
      when /\A#/
        @link_type = "Internal"
      when @@base_url
        @link_type = "Internal"
      when /https:\/\/#{@@base_url}/
        @link_type = "Internal"
      when /http:\/\/#{@@base_url}/
        @link_type = "Internal"
      when /\/\/#{@@base_url}/
        @link_type = "Internal"
        @link = "https:#{@link}"
      when /\A\/\w/
        @link_type = "Internal"
        @link = "https://#{@@base_url}#{url}"
      else
        @link_type = "External"
    end

    case url

      # when /\A\/\//
      #   puts @link
      #   response = Net::HTTP.get_response( URI("https:#{@link}"))
      #   @code = response.code
      #   puts @code
      when nil
        @code = "404"
      when /\A#/
        @code = "200"
      else
        response = Net::HTTP.get_response(URI(@link))
        @code = response.code
    end

  end
  end