require './book'
require './student'
require './teacher'



class App
  def initialize
    puts "Welcome to School Library App!"
    puts ' '
    @students = []
    @teachers = []
  end

  def display_menu
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
      create_a_student()
    elsif @input == '2'
      create_a_teacher()
    end
  end

  def create_a_student
    @classroom = 'Unknown'
    print 'Age:'
    @age = gets.chomp
    print 'Name:'
    @name = gets.chomp
    print 'Has parent permission? [Y/N]:'
    @parent_permission = gets.chomp
    @student = Student.new(@age, @classroom, @name, @parent_permission)
    @students.push(@student)
    puts 'Person created successfully'
    puts ' '
    run()
  end

  def create_a_teacher
    print 'Age:'
    @age = gets.chomp
    print 'Name:'
    @name = gets.chomp
    print 'Specialization:'
    @specialization = gets.chomp
    @teacher = Teacher.new(@age, @specialization, @name)
    @teachers.push(@teacher)
    puts 'Person created successfully'
    puts ' '
    run()
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
    elsif @answer == '7' || 'exit'
      return
    else 
      puts 'Please select a valid option'
      run()
    end
  end
end