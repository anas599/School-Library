class Rental
  attr_accessor :date, :person, :book, :return_date

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book
    @return_date = nil
  end
end
