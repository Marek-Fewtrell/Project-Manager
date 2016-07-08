# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

######## Users ########

user = User.create(first_name: 'User', last_name: 'Users', email: 'user@email.com', password: 'user')
admin = User.create(first_name: 'Admin', last_name: 'Admins', email: 'admin@email.com', password: 'admin', role: 'admin')

######## Projects ########

project1 = Project.create(title: 'Project 1', description: "Project 1's description", dev_env: 'Development environment', prod_env: 'Production Environment', language_desc: 'Language Description')
project2 = Project.create(title: 'Project 2', description: "Project 2's description", dev_env: 'Development environment', prod_env: 'Production Environment', language_desc: 'Language Description')

######## Something else ########

task1 = project1.task.create(title: 'Task 1', description: 'Task 1 in Project 1', status: 'completed')
task2 = project1.task.create(title: 'Task 2', description: 'Task 2 in Project 1', status: 'incomplete')
task3 = project1.task.create(title: 'Task 3', description: 'Task 3 in Project 1', status: 'incomplete')
task4 = project1.task.create(title: 'Task 4', description: 'Task 4 in Project 1', status: 'incomplete')
task5 = project1.task.create(title: 'Task 5', description: 'Task 5 in Project 1', status: 'completed')

p2task1 = project2.task.create(title: 'Task 1', description: 'Task 1 in Project 2', status: 'completed')
p2task2 = project2.task.create(title: 'Task 2', description: 'Task 2 in Project 3', status: 'incomplete')

######## Something else ########
