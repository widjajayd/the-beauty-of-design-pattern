class Person
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
  
  def message(text)
    puts "#{name} receiving message: #{text}"
  end
end

class Group
  attr_reader :group
  def initialize(people_in_group)
    @group = people_in_group
  end
  
  def message(text)
    group.each do |person|
      person.message(text)
    end
  end
end

# main program
@john = Person.new('John')
@jenny = Person.new('Jenny')
@family = Group.new([@john, @jenny])
@andy = Person.new('Andy')
@ann = Person.new('Ann')
@anne = Person.new('Anne')
# create tree structure
@friend = Group.new([@andy, @ann, @anne])
@all_contact = Group.new([@family, @friend])

# test by sending message to leaf, 
#   part of tree and whole tree
@john.message('This just for John')
@family.message('This message for Family members')
@all_contact.message('This message for all contacts')

# program output
# John receiving message: This just for John
# John receiving message: This message for Family members
# Jenny receiving message: This message for Family members
# John receiving message: This message for all contacts
# Jenny receiving message: This message for all contacts
# Andy receiving message: This message for all contacts
# Ann receiving message: This message for all contacts
# Anne receiving message: This message for all contacts