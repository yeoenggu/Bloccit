require 'faker'

# Create Posts
50.times do 
  Post.create!(
    title: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph
  )
end

posts = Post.all

# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph 
  )
end

p "Seed finished"
p "#{Post.count} posts created"
p "#{Comment.count} comments created"
