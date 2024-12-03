# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Post.destroy_all

Post.create(
  [
    {
      title: 'My First Post',
      content: 'This is my first post. I hope you like it.'
    },
    {
      title: 'Woodchuck Question',
      content: 'How much wood would a woodchuck chuck if a woodchuck could chuck wood?'
    },
    {
      title: 'The Simpsons',
      content: 'The Simpsons is an American animated sitcom created by Matt Groening for the Fox Broadcasting Company.'
    }
  ]
)

p "Created #{Post.count} posts"
