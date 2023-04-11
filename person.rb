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

  attr_accessor :name
  attr_accessor :age
  attr_reader :id

  # Methods
  def of_age?
    return @age >= 18
  end

  def can_use_services?
    return @age >= 18 || @parent_permission
  end

  def correct_name
    @name
  end
  private :of_age?
  public :can_use_services?
end

person = Person.new(22, 'maximilianus')
puts person.correct_name
puts capitalizedPerson = CapitalizeDecorator.new(person)
puts capitalizedPerson.correct_name
puts capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
puts capitalizedTrimmedPerson.correct_name