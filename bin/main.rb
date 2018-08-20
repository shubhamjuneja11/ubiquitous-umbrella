require_relative '../lib/employee_data_handler'
employee_hash = EmployeeDataHandler.get_employee_hash_from_file('employee_data.csv')
EmployeeDataHandler.write_to_file('employee_categories.txt', employee_hash)
