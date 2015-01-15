

class Post
  attr_reader :page, :document, :title, :url, :points, :item_id, :comments

  
  def initialize(url)
    @page = Nokogiri::HTML(open(url),nil,"utf-8") 
    @document = []
    @title = @page.css("title")[0].text
    @url = @page.css("a")[0]["href"]
    @points = @page.css(".subtext span")[0].text
    @item_id = @page.css(".subtext > a:nth-child(3)")[0]["href"]
    @comments = @page.css(".comment font")[0..-1].text
    #byebug
  end  
  
  def add_comment(comment)
    new_comment = Comment.new(comment)
    @document << new_comment  
  end  

end