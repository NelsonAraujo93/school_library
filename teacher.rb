require './person'
class Teacher < Person
  def initialize(specialization, age, name, parent_permission)
    @specialization = specialization
    super(age, name, parent_permission: parent_permission)
  end

  def can_use_services?
    true
  end
end

t = Teacher.new('Maths', 26, 'Jaime', false)

puts t.name
puts t.age
puts t.id

t.age = 30
t.name = 'Falco'

puts t.name
puts t.age

puts t.can_use_services?

puts t.correct_name