require_relative 'library'

class ListRentalsForPerson
  def initialize(library)
    @library = library
  end

  def run
    puts 'Enter the ID of the person:'
    id = gets.chomp.to_i
    puts 'Rentals:'
    @library.list_rentals_for_person(id)
  end
end
