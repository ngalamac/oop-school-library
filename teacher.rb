# Teacher class inherited from Person
class Teacher < Person
  def initialize(id, specialization, age, name = 'unknown', parent_permission: true)
    super(id, age, name, parent_permission)
    @specialization = specialization
  end

  # Override can_use_services?
  def can_use_services?
    true
  end
end
