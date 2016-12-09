# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
users = 10.times.map do
  User.create!( username: Faker::Internet.user_name,
                email: Faker::Internet.email,
                password: 'password' )
end

questions = 20.times.map do
  Question.create!( title: Faker::Hipster.words((5..10).to_a.sample).join(" ").capitalize + "?",
                    description: Faker::Hipster.paragraph(3),
                    user_id: rand(1..10) )
end

answers = 20.times.map do
  Answer.create!( text: Faker::Hacker.say_something_smart,
                  user_id: rand(1..10),
                  question_id: rand(1..20) )
end

comments = 20.times.map do
  Comment.create!( text: Faker::Hacker.say_something_smart,
                   user_id: rand(1..10),
                   commentable_id: rand(1..20),
                   commentable_type: ["Question", "Answer"].sample )
end

votes = 50.times.map do
  Vote.create( user_id: rand(1..10),
               voteable_id: rand(1..20),
               voteable_type: ["Question", "Answer", "Comment"].sample,
               vote_direction: [-1, 1].sample )
end
