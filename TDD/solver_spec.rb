require_relative 'solver'
require 'rspec'

describe 'solver methods' do
  context 'factorial of 5' do
    it 'factorial' do
      expect(Solver.new.factorial(5)).to eq(120)
    end
  end
  context 'reverse the string hello will become olleh' do
    it 'reverse' do
      expect(Solver.new.reverse('hello')).to eq('olleh')
    end
  end
  context 'fizzbuzz' do
    it 'fizzbuzz' do
      expect(Solver.new.fizzbuzz(15)).to eq('fizzbuzz')
      expect(Solver.new.fizzbuzz(4)).to eq(4.to_s)
    end
  end
end
