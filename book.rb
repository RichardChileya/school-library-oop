require_relative './rental'
class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    # @rentals.push(rental) unless @rentals.include?(rental)
    # rentals.book = self
    Rental.new(self, person, date)
  end
end
