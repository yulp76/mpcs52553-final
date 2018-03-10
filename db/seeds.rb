require 'open-uri'

Destination.delete_all
Attraction.delete_all
Category.delete_all
Wish.delete_all
User.delete_all

categories = ["Museums", "Neighborhoods", "Monuments & Statues", "Sports Venues", "Shopping",
  "Landmarks & Architecture", "Nature & Parks", "Amusement Parks & Theme Parks",
  "Zoos & Aquariums", "Theaters", "Others"]

destinations = eval(File.read("db/destinations.rb"))
attractions = eval(File.read("db/attractions.rb"))

categories.each do |category|
  Category.create name: category
end

destinations.each do |destination|
  Destination.create name: destination["name"], introduction: destination["introduction"], cover_url: destination["cover_url"]
end

attractions.each do |attraction|
  a = Attraction.new
  a.name = attraction["name"]
  a.destination_id = Destination.find_by(name: attraction["destination"]).id
  a.category_id = Category.find_by(name: attraction["category"]).id
  a.image_url = attraction["image_url"]
  a.address = attraction["address"]
  a.website = attraction["website"]
  a.save
end

User.create username: 'admin', email: 'admin@example.org', email_confirmation: 'admin@example.org', password: 'iamtheboss', password_confirmation: 'iamtheboss', admin: true
User.create username: 'testuser1', email: 'testuser1@example.org', password: 'testuser1', email_confirmation: 'testuser1@example.org', password_confirmation: 'testuser1', admin: false
User.create username: 'testuser2', email: 'testuser2@example.org', password: 'testuser2', email_confirmation: 'testuser2@example.org', password_confirmation: 'testuser2', admin: false
User.create username: 'testuser3', email: 'testuser3@example.org', password: 'testuser3', email_confirmation: 'testuser3@example.org', password_confirmation: 'testuser3', admin: false

print "There are now #{Destination.count} destinations in the database.\n"
print "There are now #{Attraction.count} attractions in the database.\n"
print "There are now #{User.count} users in the database.\n"
