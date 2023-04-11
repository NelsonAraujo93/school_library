require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'
class Person < Nameable
  # Initialize
  def initialize(age, name = 'Unknown', parent_permission: true)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @id = rand(0..1000)
  end

  attr_accessor :name, :age
  attr_reader :id

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
  private :of_age?
  public :can_use_services?
end

person = Person.new(22, 'maximilianus')
puts person.correct_name
puts capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
puts capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
