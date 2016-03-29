require 'nokogiri'
require 'open-uri'
require_relative 'comment'
require_relative 'post'

def post_argument(doc)
  title = doc.title
  url = doc.search('.title > a:nth-child(2)')[0].attributes['href'].content
  points = doc.search('.score')[0].content.gsub!(' points','').to_i
  item_id = doc.search('.score')[0].attributes['id'].content.gsub!('score_','').to_i
  post = [title,url,points,item_id]
end

def add_to_comments(post)
  doc = open(ARGV[0]) {|file| Nokogiri::HTML(file)}
  comments = doc.search('.c00').map{|c|c.content}
  # comments = doc.search('.c00').map(&:content)
  comments.each do |comment|
    post.add_comment(comment)
  end
end

doc = open(ARGV[0]) {|file| Nokogiri::HTML(file)}
post = Post.new(post_argument(doc))
add_to_comments(post)
puts "Post title: #{post.title}"
puts "Number of comments: #{post.comments.length}"