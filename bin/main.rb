require_relative '../lib/employee_data_handler'
employee_data_handler = EmployeeDataHandler.new
employee_hash = employee_data_handler.get_employee_hash_from_file('employee_data.csv')
employee_data_handler.write_to_file('employee_categories.txt', employee_hash)
