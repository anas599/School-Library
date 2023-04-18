require 'json'

class Save
  def save_books(library)
    books_arr = []
    library.books.each do |book|
      book = { title: book.title, author: book.author }
      books_arr.push(book)
    end
    File.write('books.json', JSON.generate(books_arr))
  end

  def read_books(library)
    File.write('books.json', JSON.generate([])) unless File.exist?('books.json')

    if File.exist?('./books.json') && !File.empty?('./books.json')
      json_data = File.read('./books.json')
      books = JSON.parse(json_data)
      books.each do |book|
        new_book = Book.new(book['title'], book['author'])
        library.books << new_book
      end
    else
      books = []
    end
    File.write('./books.json', books.to_json)
  end

  def save_rentals(library)
    rentals_arr = []
    library.rentals.each do |rental|
      puts rental
      rental = { book: rental.book.title, person: rental.person.name, date: rental.date }
      rentals_arr.push(rental)
    end
    File.write('rentals.json', JSON.generate(rentals_arr))
  end

  def read_rentals(library)
    File.write('rentals.json', JSON.generate([])) unless File.exist?('rentals.json')

    if File.exist?('./rentals.json') && !File.empty?('./rentals.json')
      json_data = File.read('./rentals.json')
      rentals = JSON.parse(json_data)
      rentals.each do |rental|
        new_rental = Rental.new(rental['rental_date'], library.books[rental['book']], library.person[rental['person']])
        library.rentals << new_rental
      end
    else
      rentals = []
    end
    File.write('./rentals.json', JSON.generate(rentals))
  end
end
