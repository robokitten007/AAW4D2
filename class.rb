class Employee
    attr_reader :salary
    def initialize(name, title, salary, boss)
    @name = name
    @tile = title
    @salary = salary
    @boss = boss
    end


    def bonus(multiplier)
        bonus = (salary) * multiplier
    end 

end 

class Manager < Employee
    attr_reader :salary, :all_employees

    def initialize(name, title, salary, boss)
        super(name, title, salary,boss)
        @all_employees = [] #array of employee instances 
    end 

    def add_employee(employee) # arg is an employee instance 
        @all_employees << employee
        if employee.is_a? Manager
           @all_employees += employee.all_employees
        end 
    end 

    def 
        bonus(multiplier)
        sum = 0
        @all_employees.each do |employee|
            sum += employee.salary
        end 
        bonus = sum * multiplier
    end 
end 

david = Employee.new('David', 'TA', 10000, 'Darren')
shawna = Employee.new('Shawna', 'TA',12000,'Darren')
darren = Manager.new('Darren','TA Manager', 78000,'Ned')
darren.add_employee(david)
darren.add_employee(shawna)
ned = Manager.new('Ned','Founder',1000000, nil)
ned.add_employee(darren)
puts ned.all_employees


puts ned.bonus(5) # => 500_000
puts darren.bonus(4) # => 88_000
puts david.bonus(3) # => 30_000
