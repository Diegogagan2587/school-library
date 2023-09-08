require './src/app.rb'

def main

    app = App.new

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

    answer = gets.chomp

    puts "You want option #{answer}"


end

main()