# Student class inherited from Person
require_relative 'person'

class Student < Person
  attr_reader :classroom, :name

  def initialize(classroom, age, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
    classroom.add_student(self) unless classroom.students.include?(self)
  end

  # play_hooky method
  def play_hooky
    '¯\\(ツ)/¯'
  end
end
