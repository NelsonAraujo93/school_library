require './person'
require './classroom'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name, parent_permission, classroom = 'Default')
    @classroom = classroom
    super(age, name, parent_permission: parent_permission)
  end

  def play_hooky
    '"¯\(ツ)/¯"'
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.students << self
  end
end
