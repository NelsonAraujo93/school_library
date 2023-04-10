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

puts t.person_name
puts t.person_age
puts t.person_id

t.def_age(30)
t.def_name('Falco')

puts t.person_name
puts t.person_age

puts t.can_use_services?
