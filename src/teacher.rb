require "./person.rb"

class Teacher < Person
    def initialize(age, name = "Unknow", specialization)
        super(age, name)
        @specialization = specialization
    end

    def can_use_services?
        true
    end
end
