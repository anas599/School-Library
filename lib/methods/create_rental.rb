require_relative 'library'

class CreateRentalMenu
  def initialize(library)
    @library = library
  end

  def call
    puts 'Select a book from the following list by number:'
    @library.list_books
    book_index = gets.chomp.to_i - 1

    puts 'Select a person from the following list by number:'
    @library.list_people
    person_index = gets.chomp.to_i - 1

    puts 'Enter the rental date (in yyyy-mm-dd format):'
    rental_date = gets.chomp

    book = @library.books[book_index]
    person = @library.people[person_index]

    rental = Rental.new(rental_date, book, person)
    @library.add_rental(rental)

    puts 'Rental created successfully!'
  end
end
