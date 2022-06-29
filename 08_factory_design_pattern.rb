module MenuService
  class MenuFactory
    attr_reader :menu_array
    def initialize(role:)
      @menu_array = []
      @menu = case role.downcase
              when 'sales'
                MenuSales.new
              when 'accounting'
                MenuAccounting.new
              when 'manager'
                MenuManager.new
              when 'admin'
                MenuAdmin.new
              end
      @menu_array = @menu.generate
    end
  end

  class MenuSales
    def generate
      ['location',
       'customer',
       'change_password']
    end
  end
  class MenuAccounting
    def generate
      ['bank',
       'finance',
       'change_password']
    end
  end
  class MenuManager
    def generate
      ['location',
       'customer',
       'bank',
       'finance',
       'change_password']
    end
  end 
  class MenuAdmin
    def generate
      ['location',
       'customer',
       'bank',
       'finance',
       'change_password',
       'manage_user']
    end
  end 
end

class User
  attr_reader :name, :role, :menu
  def initialize(name: , role: )
    @name = name
    @role = role
    @menu = MenuService::MenuFactory.new(role: role)
  end

  def print_menu
    puts "user #{@name} (#{@role}) will get these menu #{@menu.menu_array}"    
  end
end

# Main program
@user1 = User.new(name: 'John', role: 'Sales')
@user2 = User.new(name: 'Jen', role: 'Accounting')
@user3 = User.new(name: 'Peter', role: 'Manager')
@user4 = User.new(name: 'Andi', role: 'Admin')
@user1.print_menu
@user2.print_menu
@user3.print_menu
@user4.print_menu

# program output
# user John (Sales) will get these menu ["location", "customer", "change_password"]
# user Jen (Accounting) will get these menu ["bank", "finance", "change_password"]
# user Peter (Manager) will get these menu ["location", "customer", "bank", "finance", "change_password"]
# user Andi (Admin) will get these menu ["location", "customer", "bank", "finance", "change_password", "manage_user"]

