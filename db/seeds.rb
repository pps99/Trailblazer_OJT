# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!([{name: "Admin",email: "admin@gmail.com",password: "adminnnn",role: '0',create_user_id: 1,updated_user_id: 1,},
              {name: "User",email:   "user@gmail.com",password: "userrrrr",role: '1',create_user_id: 1,updated_user_id: 1,}])
