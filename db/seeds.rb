# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: 'admin', email: "admin@example.com", password: 'password', admin: true)
User.create(username: 'vinay', email: "vinay@example.com", password: 'password')
User.create(username: 'test', email: "test@example.com", password: 'password')
User.create(username: 'ironman', email: "ironman@example.com", password: 'password')
User.create(username: 'batman', email: "batman@example.com", password: 'password')
User.create(username: 'spiderman', email: "spiderman@example.com", password: 'password')

Category.create(name: 'Sports')
Category.create(name: 'Travel')
Category.create(name: 'Technology')
Category.create(name: 'Science')
Category.create(name: 'Health')
Category.create(name: 'Entertainment')

def create_article(title, description, user)
  Article.create(title: title, description: description, user_id: user)
end

users = User.all

users.each do |user|
  create_article("Welcome #{user.username}", 'Dummy description', user.id)
  2.times do |i|
    create_article("#{user.username}'s #{i} article", 'Dummy description', user.id)
  end
end
