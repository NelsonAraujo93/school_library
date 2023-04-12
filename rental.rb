class Rental
  def initialize(date, person, book)
    @date = date
    @book = book
    @person = person
  end

  attr_accessor :date
  attr_reader :book, :person
end
