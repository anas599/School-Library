class Book
  attr_accessor :title, :author, :rentals, :available

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    @available = true
  end

  def rent_book(person, date)
    rental = Rental.new(date, person, self)
    @rentals << rental
    person.rentals << rental
    self.available = false
    rental
  end

  def return_book(person, date)
    rental = @rentals.find { |r| r.person == person && r.return_date.nil? }
    if rental
      rental.return_date = date
      self.available = true
    else
      puts 'Error: Book is not currently rented by this person.'
    end
  end
end
