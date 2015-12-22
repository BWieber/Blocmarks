
5.times do
  user = User.create!(
    email:    Faker::Internet.email,
    password: Faker::Internet.password
  )
end
users = User.all

15.times do
  Topic.create!(
    title: Faker::Name.title
  )
end
topics = Topic.all


# Create posts
50.times do

post = Bookmark.create!(
    topic: topics.sample,
    url:   Faker::Internet.url
  )
end
posts = Bookmark.all

# Create an admin user
admin = User.create!(
email:    'admin@example.com',
password: 'helloworld',
)


puts "Seed finished"
puts "#{User.count} users created."
puts "#{Topic.count} topics created."
puts "#{Bookmark.count} bookmarks created."
