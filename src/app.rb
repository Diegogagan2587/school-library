class App
  def initialize(input=nil)
    @input = input
    puts 'App ins runing'
    puts 'with input', input
  end

  def display_menu
    puts "Welcome to School Library App!"
    puts 'Please choose and option by entering a number: git '
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

  def run
    display_menu()
    answer = gets.chomp

    if answer == 1
      app.list_all_books    
    elsif answer == 2
      app.list_all_people
    elsif answer == 3
      app.create_person
    elsif answer == 4
      app.create_book
    elsif answer == 5
      app.create_rental
    elsif answer == 6
      app.list_all_rentals_for_one_person
    elsif answer == 7
      return
    else answer = gets.chomp
    end
  end
end