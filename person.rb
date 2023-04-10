class Person
  # Initialize
  def initialize(age, name='Unknown', parent_permission:true)
    @age=age
    @name=name
    @parent_permission=parent_permission
    @id= rand(0..1000)
  end

  # Getters
  def get_age
    @age
  end

  def get_id
    @id
  end

  def get_name
    @name
  end

  # Setters
  def set_age(age)
    @age= age
  end

  def set_name(name)
    @name= name
  end

  # Methods
  def is_of_age?
    if @age >=18
      return true
    end
    false
  end

  def can_use_services?
    if @age >=18 || @parent_permission
      return true
    end
    false
  end

  private :is_of_age?
  public :can_use_services?
end
