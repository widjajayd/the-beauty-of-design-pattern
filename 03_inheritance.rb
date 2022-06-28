class Worker
  attr_reader :name, :number_of_children, :group, :total_salary

  def initialize(name: ,number_of_children:, group: )
    @name = name
    @number_of_children = number_of_children
    @group = group
    @total_salary = 0
  end

  def print_salary
    raise NotImplementedError, "must be run from inherited class"
  end
  
  protected

  def child_support
    number_of_children <= 3 ? number_of_children * 50 : 150
  end

end

class PermanentWorker < Worker
  attr_reader :fixed_allowances

  def initialize(name: ,group: ,number_of_children: 0)
    super(name: name, group: group, number_of_children: number_of_children)
    count_fixed_allowances    
  end

  def salary
    case group 
    when 'D' then 4000
    when 'E' then 5000
    when 'F' then 6000
    else 0
    end    
  end

  def count_total_salary
    @total_salary = salary + fixed_allowances + child_support
  end

  def print_salary
    puts "Name             = #{name}"
    puts "Group            = #{group}"
    puts "Salary           = #{salary}"
    puts "Fixed allowances = #{fixed_allowances}"
    puts "Child Support    = #{child_support}"
    puts "-----------------------------------"
    puts "Total Salary     = #{total_salary}"
  end 

  private
  def count_fixed_allowances
     @fixed_allowances = case group 
                       when 'D' then 1500
                       when 'E' then 2500
                       when 'F' then 3500
                       else 0
                       end   
  end   
end

class ContractWorker < Worker
  attr_reader :positional_allowance

  def initialize(name: ,group: ,number_of_children: 0)
    super(name: name, number_of_children: number_of_children, group: group)
    @positional_allowance = 0
    count_positional_allowance
  end

  def salary
    case group 
    when 'A' then 1000
    when 'B' then 2000
    when 'C' then 3000
    else 0
    end    
  end

  def count_total_salary
    @total_salary = salary + positional_allowance + child_support
  end

  def print_salary
    puts "Name                  = #{name}"
    puts "Group                 = #{group}"
    puts "Salary                = #{salary}"
    puts "Positional Allowances = #{positional_allowance}"
    puts "Child Support         = #{child_support}"
    puts "-------------------------------------"
    puts "Total Salary          = #{total_salary}"
  end

  private
  
  def count_positional_allowance
    @positional_allowance = case group 
                            when 'A' then 700
                            when 'B' then 800
                            when 'C' then 900
                            else 0
                            end
  end
end

# main program
puts "ContractWorker"
puts "--------------------------------"
@john = ContractWorker.new(name: "John",group: "A",number_of_children: 2)
@john.count_total_salary
@john.print_salary
puts
puts "PermanentWorker"
puts "--------------------------------"
@bill = PermanentWorker.new(name: "Bill",group: "E",number_of_children: 5)
@bill.count_total_salary
@bill.print_salary




