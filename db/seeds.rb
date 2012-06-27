# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'SETTING UP DEFAULT USER LOGIN'
admin_user = User.create! :name => 'Administrador', :email => 'admin@example.com', :password => 'adminnn', :password_confirmation => 'adminnn'
puts 'New user created: ' << admin_user.name
admin_user.add_role :admin

user1 = User.create! :name => 'Usuario 1', :email => 'usu1@example.com', :password => 'usu111', :password_confirmation => 'usu111'
puts 'New user created: ' << user1.name

user2 = User.create! :name => 'Usuario 2', :email => 'usu2@example.com', :password => 'usu222', :password_confirmation => 'usu222'
puts 'New user created: ' << user2.name

info_request_1 = InfoRequest.create! :title => "Titulo de solicitud #1", :creator_id => 2
puts 'Info request 1 created: ' << info_request_1.title

info_request_2 = InfoRequest.create! :title => "Titulo de solicitud #2", :creator_id => 3
puts 'Info request 2 created: ' << info_request_1.title

info_request_3 = InfoRequest.create! :title => "Titulo de solicitud #3", :creator_id => 3
puts 'Info request 3 created: ' << info_request_1.title
