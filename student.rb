require './person'
require './classroom'

class Student < Person
  def initialize(classroom_label, age, name, parent_permission)
    @classroom = Classroom.new(classroom_label)
    super(age, name, parent_permission: parent_permission)
  end

  attr_accessor :classroom

  def play_hooky
    '"¯\(ツ)/¯"'
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.students << self
  end
end
