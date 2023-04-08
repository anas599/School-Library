class Person
  def initialize(age, name = "Unknown", parent_permission = true)
        @id = Random.rand(1..9999)
        @name = name
        @age = age
    end
    attr_reader :id
    attr_accessor :name
    attr_accessor :age

    def can_use_services?
        if @age>=18 ||parent_permission ==true
            true
        else
            false
        end
        
    end
    
    private
    def is_of_age?
        if age>=18
            true
        else
            false
        end
    end
end
p tt= Person.new(29,"Anas")