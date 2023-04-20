require 'rspec'
require_relative '../book'

describe Book do
  let(:book) { Book.new('The Hobbit', 'J.R.R.') }

  describe '#new' do
    it 'takes two parameters and returns a Book object' do
      expect(book).to be_an_instance_of(Book)
    end
  end

  describe '#title' do
    it 'returns the correct title' do
      expect(book.title).to eq('The Hobbit')
    end
  end

  describe '#author' do
    it 'returns the correct author' do
      expect(book.author).to eq('J.R.R.')
    end
  end

  describe '#rentals' do
    it 'returns an empty array if no rentals' do
      expect(book.rentals).to eq([])
    end
  end
end