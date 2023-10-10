# Person class
class Person
  def initialize(id, age, name = 'unknown', parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # Getter methods...

  private

  # Private method to check if person's age is at least 18
  def of_age?
    @age >= 18
  end

  public

  # Public method to check if person is eligible to use the service
  def can_use_services?
    of_age? || @parent_permission
  end
end
