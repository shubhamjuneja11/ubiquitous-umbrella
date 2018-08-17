require_relative '../lib/EmployeeDataHandler'
employee_hash = EmployeeDataHandler.get_employee_hash_from_file('abc.csv')
EmployeeDataHandler.write_to_file('tp.csv', employee_hash)
