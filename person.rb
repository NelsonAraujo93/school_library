class Person
  # Initialize
  def initialize(age, name = 'Unknown', parent_permission: true)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @id = rand(0..1000)
  end

  # Getters
  def person_age
    @age
  end

  def person_id
    @id
  end

  def person_name
    @name
  end

  # Setters
  def def_age(age)
    @age = age
  end

  def def_name(name)
    @name = name
  end

  # Methods
  def of_age?
    return true if @age >= 18

    false
  end

  def can_use_services?
    return true if @age >= 18 || @parent_permission

    false
  end

  private :of_age?
  public :can_use_services?
end
