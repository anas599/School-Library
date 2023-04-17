require_relative 'app'

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
      when 3 then create_person_menu
      when 4 then create_book_menu
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

  def create_person_menu
    loop do
      puts 'Do you want to create a Student?(1) or a Teacher?(2) [input number]'
      choice = gets.chomp.to_i

      case choice
      when 1
        create_student
        break
      when 2
        create_teacher
        break
      else
        puts 'Invalid choice. Please try again.'
      end
    end
  end

  def create_student
    puts 'Enter student name:'
    name = gets.chomp
    puts 'Enter student age:'
    age = gets.chomp.to_i
    student = Student.new(age, name, parent_permission: true)
    @library.add_person(student)
    puts 'Student added!'
  end

  def create_teacher
    puts 'Enter teacher name:'
    name = gets.chomp
    puts 'Enter teacher age:'
    age = gets.chomp.to_i
    puts 'Enter teacher specialty:'
    specialty = gets.chomp
    teacher = Teacher.new(name, age, specialty)
    @library.add_person(teacher)
    puts 'Teacher added!'
  end

  def create_book_menu
    puts 'Enter book title:'
    title = gets.chomp
    puts 'Enter book author:'
    author = gets.chomp
    book = Book.new(title, author)
    @library.add_book(book)
    puts 'Book added!'
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
