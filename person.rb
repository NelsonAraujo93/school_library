class Person
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

  private :of_age?
  public :can_use_services?
end
