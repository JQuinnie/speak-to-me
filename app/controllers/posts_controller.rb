class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @giphy_image_url = fetch_giphy_image(@post.title)
  end

  private

  def fetch_giphy_image(query)
    api_key = ENV['GIPHY_API_KEY']
    safe_query = CGI.escape(query)
    url = "https://api.giphy.com/v1/gifs/search?api_key=#{api_key}&q=#{safe_query}&rating=g&limit=1&offset=#{rand(1000)}"

    response = HTTParty.get(url)

    if response.code == 200 && response["data"].any?
      response["data"].sample["images"]["original"]["url"]
    else
      "https://media.giphy.com/media/26AHdRkxHMyHLV1u0/giphy.gif"
    end
  end
end
