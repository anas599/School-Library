require_relative '../lib/book'
require_relative '../lib/classroom'
require_relative '../lib/rental'
require_relative '../lib/person'
require_relative '../lib/student'
require_relative '../lib/teacher'
require_relative '../lib/nameable'

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
