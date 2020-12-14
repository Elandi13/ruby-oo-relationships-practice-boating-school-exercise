require 'pry'
class Instructor

    attr_accessor :name
    
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def boatingtest
        Boatingtest.all.select{|bt|bt.instructor == self}
    end

    def all_students
        self.boatingtest.map(&:student)
    end

    def all_passed_tests
        binding.pry
        self.boatingtest.select{|bt|bt.status == "passed"}
    end

    def passed_tests
        self.all_passed_tests.map{|test|test.status == "passed"}
    end

    def failed_tests
        self.all_passed_tests.map{|test|test.status == "failed"}
    end

    def find_student(name)
        Student.all.find{|student| student.name == name}
    end

    def find_test(name)
        BoatingTest.all.find{|test| test.name == name}
    end

    def pass_student(student, name)
        test = find_test(name)
        if test && test.student.name == name
            test.status = "passed"
        else
            student = find_student(name)
        BoatingTest.new(student, name, "passed", self)
        end
    end


        

end
