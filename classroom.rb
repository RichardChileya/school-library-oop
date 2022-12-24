class Classroom
  attr_accessor :label

  attr_reader :students

  def initialize
    @label = label
    @students = []
  end

  def add_student(student)
    @students.push(student) unless @students.include?(student)
    students.classroom = self
  end
end