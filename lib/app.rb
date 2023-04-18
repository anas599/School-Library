require_relative 'classroom'
require_relative 'nameable'
require_relative 'rental'
require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require 'json'


class Library
  attr_accessor :books, :classrooms, :person

def initialize
    @books = []
    @classrooms = []
    @person = []
    @rentals = []
    
    # Load books from JSON file
    json_file = File.read('books.json')
    books_data = JSON.parse(json_file)
    books_data.each do |book_data|
      #find a way toadd an if so if file is empty it will go to empty array
      book = Book.new(book_data['title'], book_data['author'])
      @books << book
    end
  end
  def add_person(person)
    @person << person
  end

  def add_book(book)
    @books << book
  end

  def add_classroom(classroom)
    @classrooms << classroom
  end

  def add_rental(book, person, date)
    rental = Rental.new(date, person, book)
    @rentals << rental
    person.rentals << rental
    book.rentals << rental
  end

  def list_books
    if @books.empty?
      puts 'No books in library.'
    else
      puts 'Books in library:'
      @books.each do |book|
        if book.available
          puts "#{book.title} by #{book.author} (Available)"
        else
          puts "#{book.title} by #{book.author} (Rented)"
        end
      end
    end
  end

  def list_person
    if @person.empty?
      puts 'No person registered in the library.'
    else
      @person.each do |person|
        puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
      end
    end
  end

  def list_rentals_for_person(person_id)
    person = @person.find { |p| p.id == person_id }
    if person.nil?
      puts 'No person found'
      return
    end
    puts "Rentals for #{person.name}:"
    person.rentals.each do |rental|
      puts "Title: #{rental.book.title}, Author: #{rental.book.author}, Date: #{rental.date}"
    end
  end
end
