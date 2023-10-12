# Create a class Classroom with the following:
# @label instance variable, should be initialized in the constructor.
# Setter and getter for @label (remember about attr_accessor).
class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students.push(student)
    student.classroom = self
  end
end
