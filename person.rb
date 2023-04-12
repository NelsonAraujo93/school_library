require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'
class Person < Nameable
  # Initialize
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @age = age
    @name = name
    @parent_permission = parent_permission
    @id = rand(0..1000)
    @rentals = []
  end

  attr_accessor :name, :age
  attr_reader :id, :rentals

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

  def add_rental(rental)
    @rentals << rental
    rental.person = self
  end

  private :of_age?
  public :can_use_services?
end
