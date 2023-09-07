class Rental
    attr_accessor :date
    attr_reader :book, :person

    def initialize(date)
        @date = date
    end

    def book = (book)
        @book = book
        book.rentals.push(self) unless book.rentals.include?(self)
    end

    def person = (person)
        @person = person
        person.rentals.push(self) unless person.rentals.include?(self)
    end
end