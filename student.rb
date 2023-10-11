# Student class inherited from Person
require_relative 'person'

class Student < Person
  def initialize(classroom, age, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  # play_hooky method
  def play_hooky
    '¯\\(ツ)/¯'
  end
end
