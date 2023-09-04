class Person
    def initialize(age, name = 'Unknown', parent_permission = true)
        @id
        @name = name
        @age = age
        @parent_permission = parent_permission
    end

    def id
        @id
    end
    
    def name
        @name
    end

    def age
        @age
    end

    def name = (value)
        @name = value
    end

    def age = (value)
        @age = value
    end

    private def of_age?
        if age >= 18
            return true
        end
        return false
    end 
end