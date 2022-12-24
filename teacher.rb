require_relative './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, name, parent_permision)
    super(name, age, parent_permision)
    @specialization = specialization
  end

  def can_use_service?
    true
  end
end
