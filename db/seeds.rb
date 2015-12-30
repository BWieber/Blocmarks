
5.times do
  user = User.create!(
    username:     Faker::Name.first_name,
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


# Create bookmarks
20.times do
  Bookmark.create!(
    topic: topics.sample,
    user:  users.sample,
    url:   Faker::Internet.url
  )
end
bookmarks = Bookmark.all

# Create an admin user
admin = User.create!(
    username: 'Admin',
    email:    'admin@example.com',
    password: 'helloworld',
    confirmed_at: Time.now,
)

usul = User.create!(
    username: 'Usul',
    email:    'usul@arrakis.com',
    password: 'helloworld',
    confirmed_at: Time.now,
    )


puts "Seed finished"
puts "#{User.count} users created."
puts "#{Topic.count} topics created."
puts "#{Bookmark.count} bookmarks created."
