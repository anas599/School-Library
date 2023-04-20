require_relative '../book'
require_relative '../classroom'
require_relative '../rental'
require_relative '../person'
require_relative '../student'
require_relative '../teacher'
require_relative '../nameable'

describe Teacher do
  before(:each) do 
    @teacher = Teacher.new(32, 'Mathematics', 'George', parent_permission: true)
  end

  context 'Testing a Teacher class' do
    it 'should return the correct age name' do
      expect(@teacher.name).to eql 'George'
    end

    it 'should return the correct age' do
      expect(@teacher.age).to eql 32
    end
  end

    context 'Testing the can_use_services? method' do
      it 'should always retuen true' do
        expect(@teacher.can_use_services?).to be true
      end
    end
end
