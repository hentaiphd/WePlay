# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(:first_name => "Nina", :last_name => "Freeman", :email => "ninamarie315@gmail.com", :password => "hello123")
User.create(:first_name => "Emmett", :last_name => "Butler", :email => "nina@gmail.com", :password => "hello123")