# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Role.delete_all
User.delete_all
Message.delete_all

r1 = Role.create({name: "Guest"})
r2 = Role.create({name: "User"})
r3 = Role.create({name: "Admin"})
r4 = Role.create({name: "Super Admin"})

# 4.times do |n|
# 	login = "Username-#{n+1}"
# 	email = "#{login}@example.com"
# 	password = "password"
# 	password_confirmation = "password"
# 	body = "Message body-#{n+1}"
# 	type = "Public"
# u1 = User.create!({login: "Username-1", email: "Username-1@example.com", password: "password", password_confirmation: "password", role_id: r1.id})
# u2 = User.create!({login: "Username-2", email: "Username-2@example.com", password: "password", password_confirmation: "password", role_id: r2.id})
# u3 = User.create!({login: "Username-3", email: "Username-3@example.com", password: "password", password_confirmation: "password", role_id: r3.id})
# u4 = User.create!({login: "Username-4", email: "Username-4@example.com", password: "password", password_confirmation: "password", role_id: r4.id})


g = User.create!({login: "Guest", email: "guest@example.com", password: "password", password_confirmation: "password", role_id: r1.id})
u = User.create!({login: "User", email: "user@example.com", password: "password", password_confirmation: "password", role_id: r2.id})
a = User.create!({login: "Admin", email: "admin@example.com", password: "password", password_confirmation: "password", role_id: r3.id})
sa = User.create!({login: "Super Admin", email: "superadmin@example.com", password: "password", password_confirmation: "password", role_id: r4.id})

m1 = Message.create!({body: "Message-1", category: "Public", user_id: g.id})
m2 = Message.create!({body: "Message-2", category: "Private", user_id: u.id})
m3 = Message.create!({body: "Message-3", category: "Public", user_id: a.id})
m4 = Message.create!({body: "Message-4", category: "Private", user_id: sa.id})

t1 = Messagetype.create( { name: "Reporting" } )
t2 = Messagetype.create( { name: "Questions" } )
t3 = Messagetype.create( { name: "Posts" } )
