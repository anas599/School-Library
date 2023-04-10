require_relative 'person'
class Teacher < Person
  def initialize(specialization, age, name = 'Unknown')
    super(name, age)
    @specialization = specialization
  end
  attr_accessor :specialization

  def can_use_services?
    true
  end
end
