#!/usr/bin/env ruby
require './app'
require './student'
require './teacher'
require './book'
require './rental'
require 'pry'

puts 'Welcome to School Library App!'

def options
  puts ['', 'Please choose an option by entering a number:']
  puts ['1 - List all books', '2 - List all people', '3 - Create a person']
  puts ['4 - Create a book', '5 - Create a rental', '6 - List all rental for a given person id']
  puts ['7 - Exit']
end

def main
  @app = App.new if @app.nil?
  options
  option = gets.chomp
  binding.pry
  valid_options = [1, 2, 3, 4, 5, 6, 7]
  if valid_options.include?(option)
    if option == 7
      puts 'Thanks for using this app'
    else
      @app.function(option)
      main
    end
  else
    puts ['Error, choose one of the options', '']
    main
  end
end

main
