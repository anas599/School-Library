require_relative 'student'

class Classroom
  attr_accessor :name, :students, :label

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    students.push(student)
  end
end
math_classroom = Classroom.new('Math')
john = Student.new(math_classroom, 10, 'John')
p math_classroom.add_student(john)
