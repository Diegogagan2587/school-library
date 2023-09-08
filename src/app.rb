require './book'
require './student'
require './teacher'


class App
  def initialize
    @students = []
    @teachers = []
  end

  def display_menu
    puts "Welcome to School Library App!"
    puts 'Please choose and option by entering a number:'
    puts [
        '1 - List all books',
        '2 - List all people',
        '3 - Create a Person',
        '4 - Create a book',
        '5 - Create a rental',
        '6 - List all rentals for a given person id',
        '7 - Exit'
    ]
  end

  def create_a_person
    puts 'Do you wnat to create a student (1) or a teacher (2)? [Input the number]:'
    @input = "#{gets.chomp}"
    if @input == '1'
      student = Student.new
    elsif @input == '2'
      teacher == Teacher.new
    end
  end

  def run
    display_menu()
    @answer = "#{gets.chomp}"

    if @answer == '1'
      #   
    elsif @answer == '2'
      #
    elsif @answer == '3'
      create_a_person()
    elsif @answer == '4'
      #
    elsif @answer == '5'
      #
    elsif @answer == '6'
      #
    elsif @answer == '7'
      return
    else 
      puts 'Please select a valid option'
      run()
    end
  end
end