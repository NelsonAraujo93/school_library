require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'
class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  # Initialize
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @age = age
    @name = name
    @parent_permission = parent_permission
    @id = rand(0..1000)
    @rentals = []
  end

  # Methods
  def of_age?
    @age >= 18
  end

  def can_use_services?
    @age >= 18 || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    Rental.new(date, self, book)
  end

  private :of_age?
  public :can_use_services?
end
