require 'rdiscount'
require 'redcarpet'

class Block
  def initialize (source, comment, html)
    @source = source
    @comment = comment
    @html = html
  end

  def source
    @source
  end

  def comments
    # RDiscount.new(@comment.join, :smart, :filter_html).to_html
    Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true).render(@comment.join)
  end

  def html
    # RDiscount.new(@html.join).to_html
    Redcarpet::Markdown.new(Redcarpet::Render::HTML, :prettify).render(@html.join)
  end
end
