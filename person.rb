class Person
  def initialize(age, name = 'Unknown', _parent_permission: true)
    @id = Random.rand(1..9999)
    @name = name
    @age = age
  end
  attr_reader :id
  attr_accessor :name, :age

  def can_use_services?
    @age >= 18 || parent_permission == true
  end

  private

  def of_age?
    age >= 18
  end
end
