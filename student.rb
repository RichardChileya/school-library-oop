require_relative './person'

class Student
  def initialize(age, classroom, name, parent_permision)
    super(age, name, parent_permision)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
