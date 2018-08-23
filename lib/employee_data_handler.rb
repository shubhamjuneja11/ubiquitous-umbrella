require 'csv'
require_relative 'employee'

class String
  def pluralize(count)
    dup << 's' if count > 1
  end
end

# Program to read and write employee data files
class EmployeeDataHandler
  OUTPUT_FILE_SUFFIX = '_output.txt'.freeze
  def get_data_file(file_name)
    output_file_path = "#{File.dirname(file_name)}/#{File.basename(file_name, ".*")}#{OUTPUT_FILE_SUFFIX}"
    if File.file?(file_name)
      employee_hash = get_employee_hash_from_file(file_name)
      write_to_file(output_file_path, employee_hash)
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

  def write_to_file(file_name, employee_hash)
    File.open(file_name, 'w') do |file|
      employee_hash.each do |employee_designation, employee_data|
        file.puts employee_designation.pluralize(employee_data.count) || employee_designation
        employee_data.each do |employee|
          file.puts employee
        end
      end
    end
  end
end
