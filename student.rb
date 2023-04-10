require './person.rb'
class Student < Person
  def initialize(classroom, age, name, parent_permission)
    @classroom = classroom
    super(age, name, parent_permission: parent_permission)
  end

  def play_hooky
    return '"¯\(ツ)/¯"'
  end
end

s= Student.new('3A', 26, 'Jaime', false)

puts s.get_name
puts s.get_age
puts s.get_id

s.set_age(30)
s.set_name('Falco')

puts s.get_name
puts s.get_age

puts s.can_use_services?
puts s.play_hooky