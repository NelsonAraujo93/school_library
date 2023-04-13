#!/usr/bin/env ruby
require './app'
require './student.rb'
require './teacher.rb'
require './book.rb'
require './rental.rb'

$app = App.new()
puts 'Welcome to School Library App!'

def options
  puts ['', 'Please choose an option by entering a number:']
  puts ['1 - List all books', '2 - List all people', '3 - Create a person']
  puts ['4 - Create a book', '5 - Create a rental', '6 - List all rental for a given person id']
  puts ['7 - Exit']
  option = gets.chomp
end

def main
  option = options
  case option
  when '1'
    if $app.books.length === 0
      puts ['','There are no books created yet.', '']
    else
      $app.list_books
    end
    main
  when '2'
    $app.list_persons_index
    main
  when '3'
    $app.add_person
    main
  when '4'
    $app.add_book
    main
  when '5'
    $app.add_rental
    main
  when '6'
    $app.rentals_by_person_id
    main
  when '7'
    puts ('Thanks, see you soon')
  else
    puts ('Error! Please select one of the options listed below')
    main
  end
end

main