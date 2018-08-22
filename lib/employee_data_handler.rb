require 'csv'
require_relative 'employee'

class String
  def pluralize(count)
    dup << 's' if count >1
  end
end

# Program to read and write employee data files
class EmployeeDataHandler
  def get_data_file(file_name)
    if File.file?(file_name)
      employee_hash = get_employee_hash_from_file(file_name)
      output_file = File.dirname(file_name) + '/employee_data.txt'
      write_to_file(output_file, employee_hash)
    end
  end

  private def get_employee_hash_from_file(file_name)
    employee_hash = Hash.new { |hash, key| hash[key] = []}
    CSV.foreach(file_name) do |employee_data_array|
      employee_name = employee_data_array[0]
      employee_id = employee_data_array[1]
      employee_designation = employee_data_array[2]
      if employee_name && employee_id && employee_designation
        employee_hash[employee_designation] << Employee.new(employee_name, employee_id, employee_designation)
      end
    end
    employee_hash.sort
  end

  private def get_designation(employee_designation, employee_count)
    employee_designation.pluralize(employee_count)
  end

  def write_to_file(file_name, employee_hash)
    File.open(file_name, 'w') do |file|
      employee_hash.each do |employee_designation, employee_data|
        file.puts get_designation(employee_designation, employee_data.count)
        employee_data.each do |employee|
          file.puts employee.to_s
        end
      end
    end
  end
end
