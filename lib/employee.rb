# class for employee data
class Employee
  def initialize(employee_name, employee_id, employee_designation)
    @employee_name = employee_name
    @employee_id = employee_id
    @employee_designation = employee_designation
  end

  def to_s
    "#{@employee_name} (EmpId: #{@employee_id})"
  end
end
