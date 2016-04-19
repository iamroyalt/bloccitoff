require 'faker'

15.times do
  u = User.create!(
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: 'password',
  )
  u.skip_confirmation!
  u.save!
end
users = User.all

17.times do
  i = Item.create!(
    user: users.sample,
    name: Faker::Company.catch_phrase
    )
  i.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
end

items = Item.all

puts "Bloccitoff seeding complete"
puts "#{User.count} users created"
puts "#{Item.count} items created"
