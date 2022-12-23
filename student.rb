require_relative './person'

class Student < Person
  attr_reader :classroom
  
  def initialize(age, classroom, name, parent_permission)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom(classroom)
    @classroom = classroom
    classroom.students << self
  end
end
