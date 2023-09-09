require './book'
require './student'
require './teacher'
require './rental'

class App
  def initialize
    puts ' '
    puts 'Welcome to School Library App!'
    @people = []
    @books = []
    @rentals = []
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

  def list_all_books
    @books.each do |book|
      print "Title: \"#{book.title}\","
      print " Author: #{book.author}"
      puts ' '
    end
    run
  end

  def list_all_people
    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    run
  end

  def create_a_person
    puts 'Do you wnat to create a student (1) or a teacher (2)? [Input the number]:'
    @input = gets.chomp.to_s
    if @input == '1'
      create_a_student
    elsif @input == '2'
      create_a_teacher
    else
      run
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
    @people.push(@student)
    puts 'Person created successfully'
    puts ' '
    run
  end

  def create_a_teacher
    print 'Age:'
    @age = gets.chomp
    print 'Name:'
    @name = gets.chomp
    print 'Specialization:'
    @specialization = gets.chomp
    @teacher = Teacher.new(@age, @specialization, @name)
    @people.push(@teacher)
    puts 'Person created successfully'
    puts ' '
    run
  end

  def create_a_book
    print 'Title: '
    @title = gets.chomp
    print 'Author: '
    @author = gets.chomp
    @book = Book.new(@title, @author)
    @books.push(@book)
    puts 'Book created successfully'
    puts ' '
    run
  end

  def list_books_and_index
    @books.map.with_index do |book, i|
      title = book.title
      author = book.author
      puts "#{i}) Title: \"#{title}\", Author: #{author}"
    end
  end

  def create_a_rental
    puts 'Select a book from the following list by number'
    list_books_and_index
    @b_index = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    @people.each.with_index do |person, i|
      name = person.name
      id = person.id
      age = person.age
      puts "#{i}) [#{person.class}] Name: #{name}, ID: #{id}, Age: #{age}"
    end
    @index_of_person = gets.chomp.to_i

    puts 'Date: '
    date = gets.chomp

    @rental = Rental.new(date, @books[@b_index], @people[@index_of_person])
    @rentals.push(@rental)

    puts 'Rental created successfully'
    puts ' '

    run
  end

  def list_rentals_by_person
    puts 'Id of person: '
    @id_person = gets.chomp
    @rentals_by_person = @rentals.filter do |rental|
      rental.person.id.to_i == @id_person.to_i
    end

    @rentals_by_person.each do |rental|
      @date = rental.date
      @book_title = rental.book.title
      @book_author = rental.book.author
      puts "Date: #{@date}, Book \"#{@book_title}\" by #{@book_author}"
    end
    run
  end

  def run
    puts ' '
    display_menu
    @answer = gets.chomp.to_s

    case @answer
    when '1'
      list_all_books
    when '2'
      list_all_people
    when '3'
      create_a_person
    when '4'
      create_a_book
    when '5'
      create_a_rental
    when '6'
      list_rentals_by_person
    when '7', 'exit'
      puts 'Thank you for using this app!'
      nil
    else
      puts ' '
      puts 'Please select a valid option'
      run
    end
  end
end
