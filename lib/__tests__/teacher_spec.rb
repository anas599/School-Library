require 'rspec'
require_relative '../teacher'

describe Teacher do
  let(:teacher) { Teacher.new(30, 'Math', 'John') }

  describe '#new' do
    it 'returns a Teacher object' do
      expect(teacher).to be_an_instance_of(Teacher)
    end
  end
end
