# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(userId:1, budget:1000)
User.create(userId:2, budget:1000)
User.create(userId:3, budget:1000)
User.create(userId:4, budget:1000)
User.create(userId:5, budget:1000)
User.create(userId:6, budget:1000)
User.create(userId:7, budget:1000)

Item.create(itemName:"Harry Potter", startPrice:50)
Item.create(itemName:"The Da Vinci Code", startPrice:25)
Item.create(itemName:"Steve Jobs", startPrice:44)
Item.create(itemName:"Bill Gates - An epic story", startPrice:35)
