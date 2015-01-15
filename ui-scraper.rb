#!/user/bin/env_ruby

require 'rubygems'
require 'colorize'
require 'nokogiri'
require 'byebug'
require 'restclient'
require 'open-uri'

require './npost.rb'
require './comment.rb'

url = ARGV[0]
option = ARGV[1]
hackernews = Post.new(url)

  puts hackernews.title.light_red
  puts hackernews.url.light_red
  puts hackernews.item_id.light_red
  puts "Number of comments: #{hackernews.comments.length.to_s}".light_red
  puts "Points: #{hackernews.points}".light_red

  puts "To list all comments(type:all)".light_green
  puts   "To add a new commment(type:new)".light_green

  puts option
  if option == "all"
    puts hackernews.comments.light_blue 
  elsif option == "new"
    puts "Please enter your comment:".light_blue
      text = $stdin.gets.chomp
    puts "Is this correct?(y/n)\n#{text}".light_blue
      confirm = $stdin.gets.chomp
    if confirm == "y" 
      hackernews.add_comment(text)
    else    
      exit
    end  
  else
    exit
  end


# #puts hackernews.list_all


