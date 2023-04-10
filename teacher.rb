require './person.rb'
class Teacher < Person
  def initialize(specialization, age, name, parent_permission)
    @specialization = specialization
    super(age, name, parent_permission: parent_permission)
  end

  def can_use_services?
    true
  end
end

t= Teacher.new('Maths', 26, 'Jaime', false)

puts t.get_name
puts t.get_age
puts t.get_id

t.set_age(30)
t.set_name('Falco')

puts t.get_name
puts t.get_age

puts t.can_use_services?