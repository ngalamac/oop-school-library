# Teacher class inherited from Person
require_relative 'person'

class Teacher < Person
  def initialize(specialization, age, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  # Override can_use_services?
  def can_use_services?
    true
  end
end
