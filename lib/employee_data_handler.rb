require 'csv'
require_relative 'employee'
require_relative 'input_handler'

class String
  def pluralize(count)
    modified_string = self
    modified_string += 's' if count > 1
    modified_string
  end
end
# Program to read and write employee data files
class EmployeeDataHandler
  def self.get_employee_hash_from_file(file_name)
    employeee_hash = {}
    CSV.foreach(file_name) do |employee_data_array|
      employee_name = InputHandler.convert_to_valid_strip_string(employee_data_array[0])
      employee_id = InputHandler.convert_to_valid_integer(employee_data_array[1])
      employee_designation = InputHandler.convert_to_valid_strip_string(employee_data_array[2])
      employeee_hash[employee_designation] ||= []
      if InputHandler.validate_input_data?(employee_name, employee_id, employee_designation)
        employeee_hash[employee_designation] << Employee.new(employee_name, employee_id, employee_designation)
      end
    end
    employeee_hash.sort
  end

  def self.get_designation(employee_designation, employee_count)
    employee_designation.pluralize(employee_count)
  end

  def self.write_to_file(file_name, employeee_hash)
    output_string = ''
    File.open(file_name, 'w') do |file|
      employeee_hash.each do |employee_designation, employee_data|
        output_string += "\n" + get_designation(employee_designation, employee_data.count) + "\n"
        employee_data.each do |employee|
          output_string += employee.to_s
          output_string += "\n"
        end
      end
      file.puts output_string
    end
  end
end
