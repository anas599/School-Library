require_relative 'app'
require_relative './methods/create_book_menu'
require_relative './methods/create_person_menu'


class App
  def initialize
    @library = Library.new
  end

  def main # rubocop:todo Metrics/CyclomaticComplexity
    puts 'Welcome to the Library!'
    loop do
      display_options
      case gets.chomp.to_i
      when 1 then @library.list_books
      when 2 then @library.list_person
      when 3 then CreatePersonMenu.new(@library).call
      when 4 then CreateBookMenu.new(@library).call
      when 5 then create_rental_menu
      when 6 then list_rentals_for_person_menu
      when 7 then exit_program
      else puts 'Invalid choice. Please try again.'
      end
    end
  end

  private

  def display_options
    puts 'What would you like to do?'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a given person id'
    puts '7. Exit'
  end

  def create_rental_menu
    puts 'Select a book from the following list by number:'
    @library.list_books
    book = gets.chomp.to_i - 1

    puts 'Select a person from the following list by number:'
    @library.list_person
    person = gets.chomp.to_i - 1

    puts 'Enter the rental date (in yyyy-mm-dd format):'
    date = gets.chomp
    @library.add_rental(date, @library.books[book], @library.person[person])
    puts 'Rental created successfully!'
  end

  def list_rentals_for_person_menu
    puts 'Enter the ID of the person:'
    id = gets.chomp.to_i
    puts 'Rentals:'
    @library.list_rentals_for_person(id)
  end

  def exit_program
    puts 'Thank you for using this app!'
    exit
  end
end

app = App.new
app.main
