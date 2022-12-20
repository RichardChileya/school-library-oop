require_relative './nameable.rb'

class BaseDecorator < Nameable
  attr_accessor :Nameable

  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end