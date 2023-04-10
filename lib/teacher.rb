require_relative 'person'
class Teacher < Person
  def initialize(specialization, age, name = 'Unknown')
    super(name, age, parent_permission)
    @specialization = specialization
  end
  attr_accessor :specialization

  def can_use_services?
    true
  end
end
