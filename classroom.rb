class Classroom
  attr_reader :label, :students

  def initialize(label)
    @label = label
    @students = []
  end

  def student(students)
    @students << students
    students.classroom = self
  end
end
