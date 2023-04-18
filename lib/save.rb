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
end
