# generate name
class Generator
  def render
    "#{title}
     #{content}"
  end

  def title
    raise NotImplementedError
  end

  def content
    raise NotImplementedError
  end
end

# html format
class Html < Generator
  def title
    '<h1> Hello world|</h1>'
  end

  def content
    "<div class='content'>
       <p>lorem ipsum</p>
     </div>"
  end
end

# markdown format
class Markdown < Generator
  def title
    '# hello world!'
  end

  def content
    'lorem ipsum'
  end
end

@news1 = Html.new
puts @news1.render
@news2 = Markdown.new
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