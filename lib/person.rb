require_relative 'nameable'

class Person < Nameable
  def initialize(age, name = 'Unknown', _parent_permission: true)
    super()
    @id = Random.rand(1..9999)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_reader :id
  attr_accessor :name, :age

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end

class BaseDecorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.capitalize    
  end
end
class TrimmerDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.slice(0,10)    
  end
end

person = Person.new(22, 'maximilianus')
    person.correct_name
    capitalizedPerson = CapitalizeDecorator.new(person)
    capitalizedPerson.correct_name
    capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
  p capitalizedTrimmedPerson.correct_name