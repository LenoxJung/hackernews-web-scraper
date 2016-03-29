class Post
  attr_reader :comments, :title, :url, :points, :item_id
  def initialize(arr)
    @title = arr[0]
    @url = arr[1]
    @points = arr[2]
    @item_id = arr[3]
    @comments = []
  end

  def add_comment(comment)
    @comments << comment
  end

end

