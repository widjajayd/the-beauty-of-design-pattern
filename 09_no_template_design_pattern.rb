# generate name
class Generator
  attr_reader :format
  def initialize(format:)
    @format = format
  end

  def render
    "#{title}
     #{content}"
  end

  def title
    if @format == :html
      '<h1> Hello world|</h1>'
    elsif @format == :markdown
      '# hello world!'
    end
  end

  def content
    if @format == :html
      "<div class='content'>
         <p>lorem ipsum</p>
       </div>"
    elsif @format == :markdown
      "lorem ipsum"
    end
  end
end

# main program
puts "news html format"
@news1 = Generator.new(format: :html)
puts @news1.render
puts "news markdown format"
@news2 = Generator.new(format: :markdown)
puts @news2.render

# program output
# news html format
# <h1> Hello world|</h1>
# <div class='content'>
#  <p>lorem ipsum</p>
# </div>
# news markdown format
# # hello world!
# lorem ipsum