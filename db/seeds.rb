# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: 'admin', phone: '555 101010', address: 'Bishkek, Chui 23', email: 'admin@example.com', password: '123456', password_confirmation: '123456')

11.times do
	u = User.new
	u.fullname = Faker::Name.name
	u.phone = Faker::PhoneNumber.cell_phone
	u.nickname = Faker::Address.city
	u.email = Faker::Internet.email
	u.password = '123456'
	u.password_confirmation = '123456'
	u.save
end

def copy_image_fixture(file_name, id)
  dir = Rails.root.join('public', 'uploads')
  Dir.mkdir(dir) unless File.directory?(dir)
  FileUtils.cp(file_name, dir.join(id.to_s))
end

users = User.all

fixtures_path = Rails.root.join('app', 'assets', 'images', 'fixtures')


pl_imgs = ['traveller_coffee.png', "bukhara.png"]
dish_imgs = ["traveller_latter_singapour.png", "bukhara_salad_cesar.png"]

6.times do
	f = Place.new
	f.title = Faker::Lorem.characters(20)
	f.description = Faker::Lorem.sentence
	f.image = File.new(fixtures_path.join(pl_imgs.sample))
	f.save
end

places = Place.all

for place in places 
	
	rand(1..5).times do
		place.dishes.create(title: Faker::Lorem.characters(20), description: Faker::Lorem.sentence, price: rand(100..1000)
	end
end

10.times do 
	frd = Followship.new
	frd.user_id = users.find(rand(1..11)).id
	frd.follower_id = users.find(rand(1..11)).id
	frd.save
end