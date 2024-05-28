user = FactoryBot.create(:user)
11.times do
  user.posts.create(body: Faker::Lorem.paragraph_by_chars(number: rand(1..140)))
end
