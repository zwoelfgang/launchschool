class Student
  def initialize(n)
    @grade = n
  end

  def better_grade_than?(object)
    grade - object.grade > 0 ? true : false
  end

  protected

  attr_reader :grade
end

joe = Student.new(95)
bob = Student.new(85)

puts "Well done!" if joe.better_grade_than?(bob)

joe.grade