require 'faker'

def em string
  puts "*" * 50
  puts "   " + string
  puts "*" * 50
end

def get_long_content
  Faker::HitchhikersGuideToTheGalaxy.quote +
  Faker::HeyArnold.quote +
  Faker::HowIMetYourMother.quote +
  Faker::Movie.quote +
  Faker::Seinfeld.quote +
  Faker::Dune.quote +
  Faker::HitchhikersGuideToTheGalaxy.quote +
  Faker::HeyArnold.quote +
  Faker::HowIMetYourMother.quote +
  Faker::Movie.quote +
  Faker::Seinfeld.quote +
  Faker::Dune.quote +
  Faker::HitchhikersGuideToTheGalaxy.quote +
  Faker::HeyArnold.quote +
  Faker::HowIMetYourMother.quote +
  Faker::Movie.quote +
  Faker::Seinfeld.quote +
  Faker::Dune.quote
end

def get_short_content
  Faker::HitchhikersGuideToTheGalaxy.quote +
  Faker::HeyArnold.quote
end

def get_random_quote
  case [*1..6].sample
    when 1 then Faker::HitchhikersGuideToTheGalaxy.quote
    when 2 then Faker::HeyArnold.quote
    when 3 then Faker::HowIMetYourMother.quote
    when 4 then Faker::Movie.quote
    when 5 then Faker::Seinfeld.quote
    when 6 then Faker::Dune.quote
  end
end

def get_profile_image
  "http://placebeard.it/#{[*145..155].sample}/#{[*145..155].sample}"
end

def get_main_image
  "https://picsum.photos/725/484?image=#{[*0..100].sample}"
end

def get_thumb_image
  "https://picsum.photos/300/400?image=#{[*101..200].sample}"
end

def get_address
  Faker::Address.street_address + " " + Faker::Address.city + ", " + Faker::Address.zip_code
end

def get_color
  ["red","green","blue"].sample
end

def get_date
  DateTime.new(2018,[*1..12].sample,[*1..28].sample,[*1..12].sample,[*1..59].sample,6)
end

User.create!(
  email: "test@test.com",
  name: "Homer",
  password: "asdfasdf",
  password_confirmation: "asdfasdf",
  roles: "user",
)

puts "1 User created"

User.create!(
  email: "admin@test.com",
  name: "Admin",
  password: "asdfasdf",
  password_confirmation: "asdfasdf",
  roles: "admin",
)

10.times do |i|
  name = Faker::Book.author
  User.create!(
    email: "#{name.delete(' ')}@test.com",
    name: "name",
    password: "asdfasdf",
    password_confirmation: "asdfasdf",
    roles: "user",
  )
end

puts "1 Admin User created"
em get_main_image
60.times do
date = get_date
Event.create!(title:Faker::Book.title,
              body: get_short_content,
              image:get_main_image,
              description: Faker::Book.title,
              location: get_address,
              date: date,
              thumb_image: get_thumb_image,
              user_id: [*1..User.count].sample,
              start: date,
              end: date + 1,
              color: get_color
              )

end


