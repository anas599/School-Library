require_relative 'nameable'
require_relative 'rental'
require_relative 'book'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super(age, name)
    @id = Random.rand(1..9999)
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_reader :id
  attr_accessor :name, :age, :rentals

  def rent_book(book, date)
    rental = Rental.new(date, self, book)
    @rentals << rental
    book.rentals << rental
    book.available = false
    rental
  end

  def return_book(book, date)
    rental = @rentals.find { |r| r.book == book && r.return_date.nil? }
    if rental
      rental.return_date = date
      book.available = true
    else
      puts 'Error: Book is not currently rented by this person.'
    end
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def of_age?
    @age >= 18
  end
end
