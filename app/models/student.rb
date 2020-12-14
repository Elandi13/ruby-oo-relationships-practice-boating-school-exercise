class Student

    attr_accessor :student_name

    @@all = []

    def initialize(first_name)
        @name = student_name
        @@all << self
    end

    def self.all
        @@all
    end

    def boatingtest
        Boatingtest.all.select{|bt|bt.student == self}
    end

    def all_instructor
        self.boatingtest.map(&:instructor)
    end

    def add_boating_test(name, status, instructor)
        self.boatingtest(self, name, status, instructor)
    end

    def self.find_student(student_first_name)
        self.all.find{|student| student.first_name == student_first_name}
    end

    def grade_percentage 
        studentTests = BoatingTest.all.find_all{|test| test.student.first_name == self.first_name}
        totalTests = studentTests.length.to_f
        totalPassed = studentTests.find_all{|test| test.status == "passed"}
        numPassed = totalPassed.length.to_f
        percent = (numPassed/totalTests)*100
    end

end
