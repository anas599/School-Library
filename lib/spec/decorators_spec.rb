require_relative '../person'
require 'rspec'

describe CapitalizeDecorator do
  let(:x) { CapitalizeDecorator.new(Person.new(18, 'Math', 'hanna')) }

  describe '#correct_name' do
    it 'returns capitalized name' do
      expect(x.correct_name).to eq('Hanna')
    end
  end
end
