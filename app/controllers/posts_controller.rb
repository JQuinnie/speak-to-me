class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @giphy_image_url = fetch_giphy_image(@post.title)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def fetch_giphy_image(query)
    if (api_key = ENV['GIPHY_API_KEY']).present?
      safe_query = CGI.escape(query)
      url = "https://api.giphy.com/v1/gifs/search?api_key=#{api_key}&q=#{safe_query}&rating=g&limit=1&offset=#{rand(1000)}"

      response = HTTParty.get(url)

      if response.code == 200 && response["data"].any?
        response["data"].sample["images"]["original"]["url"]
      else
        "https://media.giphy.com/media/26AHdRkxHMyHLV1u0/giphy.gif"
      end
    else
      "https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExYnpxdnJ2dm9iam9zbGpmZzBlMHo1MmZjZndhN2Z2dWlzcW1vaTQwbyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/ALgyanclvTpPG/giphy.gif"
    end
  end
end
