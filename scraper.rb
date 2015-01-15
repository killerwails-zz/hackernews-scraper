require 'rubygems'
require 'nokogiri'
require 'byebug'
require 'restclient'
require 'open-uri'

class Hnparse

  def initialize
    @page = Nokogiri::HTML(open("post.html"),nil,"utf-8")  
  end

  def title
   @page.css("title")[0].text  
  end

  def url
   @page.css("a")[0]["href"]
  end
  
  def points
    @page.css(".subtext span")[0].text
  end
  
  def item_id
    @page.css(".subtext > a:nth-child(3)")[0]["href"]
  end

  def comments
    @page.css(".comment font")[0..-1]
  end  
end#class 

Hnparse.new.comments