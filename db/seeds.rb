require 'faker'

# create Users
# 19.times do
#   User.create!(
#     name: Faker::Name.name,
#     email: Faker::Internet.email,
#     password: Faker::Internet.password
#     )
# end

# create Locations
# 20.times do
#   Location.create!(
#     name: Faker::Address.city,
#     note: Faker::Lorem.sentences(2, true).flatten.join(" "),
#     zip: Faker::Address.zip,
#     user: User.all.sample
#     )
# end

user1 = User.create!(name: "Jason Allen", password: "1234", email: "a@b.com")

 Location.create!(
    name: "Brooklyn",
    note: "Current home area, 50mi radius",
    zip: "11232",
    user_id: 1
    )
 Location.create!(
    name: "Washington, DC",
    note: "New home area, as of 6/20/2016 -- around the corner from DBC WDC!",
    zip: "20036",
    user_id: 1
    )
 Location.create!(
    name: "Alexandria, VA",
    note: "Destination for Summer 2016",
    zip: "22305",
    user_id: 1
    )
 Location.create!(
    name: "Boynton Beach, FL",
    note: "Parents' area",
    zip: "33434",
    user_id: 1
    )
 Location.create!(
    name: "Manhattan, NY",
    note: "Financial District, centered on DBC's Location",
    zip: "10011",
    user_id: 1
    )
