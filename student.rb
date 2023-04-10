require './person'
class Student < Person
  def initialize(classroom, age, name, parent_permission)
    @classroom = classroom
    super(age, name, parent_permission: parent_permission)
  end

  def play_hooky
    '"¯\(ツ)/¯"'
  end
end

s = Student.new('3A', 26, 'Jaime', false)

puts s.person_name
puts s.person_age
puts s.person_id

s.def_age(30)
s.def_name('Falco')

puts s.person_name
puts s.person_age

puts s.can_use_services?
puts s.play_hooky
