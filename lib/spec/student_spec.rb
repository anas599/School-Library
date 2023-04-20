require 'rspec'
require_relative '../student'

describe Student do
  let(:student) { Student.new(18, 'Math', 'Hanna') }

  describe '#new' do
    it 'returns a Student object' do
      expect(student).to be_an_instance_of(Student)
    end
  end

  describe '#play_hooky' do
    it 'returns symbol emoji' do
      expect(student.play_hooky).to eq('¯(ツ)/¯')
    end
  end
end
