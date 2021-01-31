# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 group = Group.create!({ name: "Students#{Time.now.to_i}", group_type: 'Study', status: :active })
 user = User.create!( first_name: "Tolik#{Time.now.to_i}", last_name: 'Tolikovsky6', personal_data: 'sdfsdfsd',
                      password: 'password6', email: "email#{Time.now.to_i}@email.com")
 Post.create!( title: "Post#{Time.now.to_i}", body: "Body#{Time.now.to_i}", published_at: "#{DateTime.current.to_i}", user_id: 1)
Membership.create!(user: user, group: group)