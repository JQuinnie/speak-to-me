class Post < ApplicationRecord
  # by specifying resources :posts in config/routes.rb, Rails automatically creates the seven RESTful routes for the Post model

  # validations
  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
end
