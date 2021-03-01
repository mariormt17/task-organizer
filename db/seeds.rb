# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# CREATING USERS
['mario', 'karen', 'ruben', 'jeniset', 'isela'].each do |name|
  User.create email: "#{name}@example.com", password: '123456'
end

puts "Users has been created"

['Development', 'Marketing', 'Conceptualization', 'Exercises'].each do |name|
  Category.create name: name, description: '--'
end

puts "Categories has been created"

owner = User.find_by(email: 'email@example.com')

tasks = [
  ['Conceptualization', 'Welcome', ['mario:1', 'karen:2', 'isela:random']],
  ['Conceptualization', 'What is Ruby on Rails?', ['mario:1', 'karen:2', 'isela:random']],
  ['Conceptualization', 'Development environment of Ruby on Rails', ['mario:1', 'karen:2', 'isela:random']],
  ['Exercises', 'Instalation of Ruby on Rails on Windows and Linux', ['mario:1', 'karen:2', 'isela:random']],
  ['Conceptualization', 'Understand the web with rails', ['mario:1', 'karen:2', 'isela:random']],
  ['Exercises', 'Create a new RoR application ¡Hello Rails!', ['mario:1', 'karen:2', 'isela:random']],
  ['Exercises', 'Manipulate the MVC pattern', ['mario:1', 'karen:2', 'isela:random']],
  ['Conceptualization', 'What will we to develop', ['mario:1', 'karen:2', 'isela:random']],
  ['Development', 'Create the base of our application', ['mario:1', 'karen:2', 'isela:random']],
  ['Development', 'The rails secrets', ['mario:1', 'karen:2', 'isela:random']],
  ['Conceptualization', 'Assets and Layouts', ['mario:1', 'karen:2', 'isela:random']],
  ['Conceptualization', 'Design the model data', ['mario:1', 'karen:2', 'isela:random']],
  ['Development', 'Add the first set of scaffolds', ['mario:1', 'karen:2', 'isela:random']],
  ['Development', 'How to understand the migrations', ['mario:1', 'karen:2', 'isela:random']],
  ['Development', 'Steroids for your Development - HAML', ['mario:1', 'karen:2', 'isela:random']],
  ['Development', 'Steroids for your Development - Simple Form', ['mario:1', 'karen:2', 'isela:random']],
  ['Development', 'Regenerating the first set of scaffolds', ['mario:1', 'karen:2', 'isela:random']],
  ['Development', 'Internationalizing our application', ['mario:1', 'karen:2', 'isela:random']],
  ['Conceptualization', 'Steroids for your Development - Debugging', ['mario:1', 'karen:2', 'isela:random']],
  ['Development', 'Add model validations', ['mario:1', 'karen:2', 'isela:random']],
  ['Development', 'Adding the User concept', ['mario:1', 'karen:2', 'isela:random']],
  ['Development', 'Add participants to task', ['mario:1', 'karen:2', 'isela:random']],
  ['Development', 'CanCanCan gem', ['mario:1', 'karen:2', 'isela:random']],
  ['Development', 'Callbacks on Rails', ['mario:1', 'karen:2', 'isela:random']],
  ['Development', 'Send email to participants', ['mario:1', 'karen:2', 'isela:random']],
  ['Development', 'Add coments through AJAX', ['mario:1', 'karen:2', 'isela:random']],
  ['Development', 'Beautify our application', ['mario:1', 'karen:2', 'isela:random']],
  ['Conceptualization', 'Deploy on Heroku', ['mario:1', 'karen:2', 'isela:random']],
  ['Conceptualization', 'Course conclusions', ['mario:1', 'karen:2', 'isela:random']]
]

tasks.each do |category, description, participant_set|
  participants = participant_set.map do |participant|
    user_name, raw_role = participant.split(':')
    role = raw_role == 'random' ? [1,2].sample : raw_role
    Participant.new(
      user: User.find_by(email: "#{user_name}@example.com"),
      role: role.to_i
    )
  end
  Task.create!(
    category: Category.find_by(name: category),
    name: "Task ##{Task.count + 1}",
    description: description,
    due_date: Date.today + 15.days,
    owner: owner,
    participating_users: participants
  )
end

puts "Tasks has been created"
