
5.times do
  user = User.create!(
    email:        Faker::Internet.email,
    password:     Faker::Internet.password,
    confirmed_at: Time.now
  )
end
users = User.all

15.times do
  Topic.create!(
    user:  users.sample,
    title: Faker::Name.title,
  )
end
topics = Topic.all


# Create posts
20.times do

post = Bookmark.create!(
    topic: topics.sample,
    url:   Faker::Internet.url
  )
end
bookmarks = Bookmark.all

# Create an admin user
admin = User.create!(
email:    'admin@example.com',
password: 'helloworld',
confirmed_at: Time.now,
)

usul = User.create!(
email:    'usul@arrakis.com',
password: 'helloworld',
confirmed_at: Time.now,
)


puts "Seed finished"
puts "#{User.count} users created."
puts "#{Topic.count} topics created."
puts "#{Bookmark.count} bookmarks created."
