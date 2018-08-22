require_relative '../lib/employee_data_handler'
employee_data_handler = EmployeeDataHandler.new
if ARGV[0] && employee_data_handler.get_data_file(ARGV[0])
  puts 'File created'
else
  puts 'Invalid path'
end
