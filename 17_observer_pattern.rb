class Medium
  attr_reader :creator_name, :stories, :followers
  def initialize(creator_name)
    @creator_name = creator_name
    @stories = []
    @followers = []
  end

  def add_follower(person)
    followers << person
  end

  def unfollow(person)
    followers.delete(person)
  end

  def add_story(new_story)
    stories << new_story
    followers.each do |person|
      person.update(self)
    end
  end
end

class Person
  attr_reader :name
  def initialize(name:)
    @name = name
  end

  def update(story)
    puts "#{self.name} was informed about #{story.stories.last} by #{story.creator_name}."
  end
end

# main program
@judy = Medium.new('Judy')
@john = Person.new(name: 'John')
@jenny = Person.new(name: 'Jenny')
@judy.add_follower(@john)
@judy.add_follower(@jenny)
@judy.add_story('Chain of Responsibility design pattern')
@judy.add_story('Prototype Design Pattern')

# program output
# John was informed about Chain of Responsibility design pattern by Judy.
# Jenny was informed about Chain of Responsibility design pattern by Judy.
# John was informed about Prototype Design Pattern by Judy.
# Jenny was informed about Prototype Design Pattern by Judy.