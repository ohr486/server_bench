# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

group = Group.create(title: 'sample')
User.create([{group_id: group.id, name: "user1", age: 10},
             {group_id: group.id, name: "user2", age: 20}])
