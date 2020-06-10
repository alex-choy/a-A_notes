require "employee"

class Startup
  attr_reader :name, :funding, :salaries, :employees
  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    self.salaries.has_key?(title)
  end

  def >(startup2)
    self.funding > startup2.funding
  end

  def hire(employee_name, title)
    raise 'Invalid title' if !valid_title?(title)
    self.employees << Employee.new(employee_name, title)
  end

  def size
    self.employees.length
  end

  def pay_employee(employee) 
    salary = self.salaries[employee.title]
    raise 'Not enough funding to pay employee' if salary > self.funding
    employee.pay(salary)
    @funding -= salary
  end

  def payday
    employees.each {|emp| pay_employee(emp)}
  end

  def average_salary
    @employees.map{|emp| self.salaries[emp.title]}.sum / @employees.length
  end

  def close
    @employees = []
    @funding = 0
  end
  
  def acquire(startup2)
    @funding += startup2.funding
    startup2.salaries.each {|title, salary| @salaries[title] = salary if !@salaries.has_key?(title)}
    @employees += startup2.employees
    startup2.close
  end
end
