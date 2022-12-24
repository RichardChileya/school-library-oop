require_relative './nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age, name = 'unknown', parrent_permission = 'true')
    super()

    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parrent_permission = parrent_permission
    @rentals = []
  end

  def can_use_service?
    of_age? || @parrent_permission == true
  end

  def of_age?
    @age >= 18
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    # @rentals.push
    # rental.person = self
    Rental.new(self, book, date)
  end
end
