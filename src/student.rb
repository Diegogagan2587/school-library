require "./person.rb"

class Student < Person
    def initialize(age, name = "Unknown", parent_permission = true, classroom)
        super(age, name, parent_permission)
        @classroom = classroom
    end
    def play_hooky
        "¯\(ツ)/¯"
    end
end
