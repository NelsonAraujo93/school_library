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

puts s.name
puts s.age
puts s.id

s.age = 30
s.name = 'Falco'

puts s.name
puts s.age

puts s.can_use_services?
puts s.play_hooky
