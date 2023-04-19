require_relative 'nameable'
require_relative 'rental'
require_relative 'book'
require_relative 'classroom'

class Person < Nameable
  def initialize(age, _parent_permission, name = 'Unknown')
    @@id = 0
    super()
    @id = @@id += 1
    @name = name
    @age = age
    @parent_permission = true
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

  class BaseDecorator < Nameable
    def initialize(nameable)
      super()
      @nameable = nameable
    end

    def correct_name
      @nameable.correct_name
    end
  end

  class CapitalizeDecorator < BaseDecorator
    def correct_name
      @nameable.correct_name.capitalize
    end
  end

  class TrimmerDecorator < BaseDecorator
    def correct_name
      @nameable.correct_name.slice(0, 10)
    end
  end
end
