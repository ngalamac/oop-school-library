# Student class inherited from Person
class Student < Person
  def initialize(id, classroom, age, name = 'unknown', parent_permission: true)
    super(id, age, name, parent_permission)
    @classroom = classroom
  end

  # play_hooky method
  def play_hooky
    '¯\\(ツ)/¯'
  end
end
