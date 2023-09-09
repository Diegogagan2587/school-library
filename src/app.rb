require './book'
require './student'
require './teacher'
require './rental'



class App
  def initialize
    puts "Welcome to School Library App!"
    puts ' '
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
    @books.each { |book|
    print "Title: \"#{book.title}\","
    print " Author: #{book.author}"
    puts ' '
    }
    run()
  end

  def list_all_people
    @students.each { |student|
      puts "[Student] Name: #{student.name}, ID: #{student.id}, Age: #{student.age}"
    }
    @teachers.each { |teacher|
      puts "[Teacher] Name: #{teacher.name}, ID: #{teacher.id}, Age: #{teacher.age}"
    }
    run()
  end

  def create_a_person
    puts 'Do you wnat to create a student (1) or a teacher (2)? [Input the number]:'
    @input = "#{gets.chomp}"
    if @input == '1'
      create_a_student()
    elsif @input == '2'
      create_a_teacher()
    else
      run()
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
    @people.push(@teacher)
    puts 'Person created successfully'
    puts ' '
    run()
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
    run()
  end

  def create_a_rental
    puts 'Select a book from the following list by number'
    @books.map.with_index { |book, i |
      title = book.title 
      author = book.author
      puts "#{i}) Title: \"#{title}\", Author: #{author}"
    }
    @b_index = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    @people.each.with_index { |person, i|
      name = person.name
      id = person.id
      age = person.age
      puts "#{i}) [#{person.class}] Name: #{name}, ID: #{id}, Age: #{age}"
    }
    @index_of_person = gets.chomp.to_i

    puts 'Date: '
    date = gets.chomp

    @rental = Rental.new(date, @books[@b_index], @people[@index_of_person])
    @rentals.push(@rental)

    puts 'Rental created successfully'
    puts ' '

    run()
  end

  def list_rentals_by_person
    puts 'Id of person: '
    @id_person = gets.chomp
    @rentals_by_person = @rentals.filter {|rental|
      rental.person.id.to_i == @id_person.to_i
    }

    @rentals_by_person.each { |rental|
      @date = rental.date
      @book_title = rental.book.title
      @book_author = rental.book.author 
      puts "Date: #{@date}, Book \"#{@book_title}\" by #{@book_author}"
    }
    puts 'Rentals founded!!!!'
  end

  def run
    puts " "
    display_menu()
    @answer = "#{gets.chomp}"

    if @answer == '1'
      list_all_books()   
    elsif @answer == '2'
      list_all_people()
    elsif @answer == '3'
      create_a_person()
    elsif @answer == '4'
      create_a_book()
    elsif @answer == '5'
      create_a_rental()
    elsif @answer == '6'
      list_rentals_by_person()
    elsif @answer == '7' || @answer == 'exit'
      puts "Thank you for using this app!"
      return
    else 
      puts 'Please select a valid option'
      run()
    end
  end
end