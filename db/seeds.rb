# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'json'
require 'open-uri'

puts "Resetting the database..."

User.destroy_all


puts "Database resetted!"

puts "Generating users..."

user1 = User.create!(
  email: "user1@gmail.com",
  password: 'password123',
  password_confirmation: 'password123',
  first_name: "Sive",
  last_name: "Maqanda",
  username: "RogerTheScholar",
  gender: "Male",
  bio: "Aspiring data scientist and tennis club captain 🎾 Always analyzing stats on and off the court. Here to ace my studies and keep learning! 📚 #DataDriven"
)

user1_url = "https://hips.hearstapps.com/hmg-prod/images/gettyimages-1322028686.jpg"
user1_file = URI.open(user1_url)
user1.photo.attach(io: user1_file, filename: 'user1_img.jpeg', content_type: 'image/png')
user1.save!

user2 = User.create!(
  email: "user2@gmail.com",
  password: 'password123',
  password_confirmation: 'password123',
  first_name: "Novak",
  last_name: "Djokovic",
  username: "NovakTheNoteTaker",
  gender: "Male",
  bio: "Engineering major and study group leader 🚀 Breaking down equations as fast as serves. Proud note-taking perfectionist and quick on the quiz circuit! #BrainAndBrawn"
)

user2_url = "https://static.standard.co.uk/2023/07/12/12/AFP_33NQ8UY.jpg?width=1200&height=1200&fit=crop"
user2_file = URI.open(user2_url)
user2.photo.attach(io: user2_file, filename: 'user2_img.jpeg', content_type: 'image/png')
user2.save!

user3 = User.create!(
  email: "user3@gmail.com",
  password: 'password123',
  password_confirmation: 'password123',
  first_name: "Serena",
  last_name: "Netqueen",
  username: "ScienceSerena",
  gender: "Female",
  bio: "Physics enthusiast with a passion for experiments! 🔬 Balancing lab reports with tennis practice and aiming for breakthroughs in both. #ScienceAndSports"
)

user3_url = "https://media.allure.com/photos/63222c2f9650fe336baa57eb/1:1/w_354%2Cc_limit/Serena%2520Williams%2520knee%2520length%2520ponytail.jpg"
user3_file = URI.open(user3_url)
user3.photo.attach(io: user3_file, filename: 'user3_img.jpeg', content_type: 'image/png')
user3.save!

user4 = User.create!(
  email: "user4@gmail.com",
  password: 'password123',
  password_confirmation: 'password123',
  first_name: "Sam",
  last_name: "Smashdal",
  username: "RafTheResearcher",
  gender: "Male",
  bio: "Ecology major focused on conservation! 🌿 Balancing studies with tennis and always ready to dig deeper in research. Vamos! 🌍 #EcoWarrior"
)

user4_url = "https://lh3.googleusercontent.com/0zBp8Xvu-qgbNzvm6o9K-D7eJ3ndGxhnJuP5MyRakwr4zViygq2fOrvZJuD0Q8Fp3bRsekJIZ-9O3fqIe4xTIEuoJryYhYbR5w"
user4_file = URI.open(user4_url)
user4.photo.attach(io: user4_file, filename: 'user4_img.jpeg', content_type: 'image/png')
user4.save!

user5 = User.create!(
  email: "user5@gmail.com",
  password: 'password123',
  password_confirmation: 'password123',
  first_name: "Stella",
  last_name: "Dropshot",
  username: "StudyStella",
  gender: "Female",
  bio: "Math major, problem solver, and weekend squash player 🏸 I’m all about equations and hitting that winning shot in both math and sports. #STEMQueen"
)

user5_url = "https://i0.wp.com/padelathletes.com/wp-content/uploads/2023/01/marta-marrero_estrella-damm-madrid-master-final-2021__dsc8103-copia-1900x1068-1.jpg?resize=1024%2C576&ssl=1"
user5_file = URI.open(user5_url)
user5.photo.attach(io: user5_file, filename: 'user5_img.jpeg', content_type: 'image/png')
user5.save!

user6 = User.create!(
  email: "user6@gmail.com",
  password: 'password123',
  password_confirmation: 'password123',
  first_name: "Andy",
  last_name: "SliceMurray",
  username: "AndyTheAnalyst",
  gender: "Male",
  bio: "Economics and data analysis student 📊 Known for a solid backhand slice and a knack for analyzing market trends. #SliceThroughData"
)

user6_url = "https://www.thetimes.co.uk/imageserver/image/%2Fmethode%2Ftimes%2Fprod%2Fweb%2Fbin%2Fa4202fec-cb60-4129-8c6c-13fd80378a22.jpg?crop=4992%2C3330%2C0%2C929"
user6_file = URI.open(user6_url)
user6.photo.attach(io: user6_file, filename: 'user6_img.jpeg', content_type: 'image/png')
user6.save!

user7 = User.create!(
  email: "user7@gmail.com",
  password: 'password123',
  password_confirmation: 'password123',
  first_name: "Venus",
  last_name: "Rallyqueen",
  username: "VenusVisionary",
  gender: "Female",
  bio: "Aspiring psychologist and part-time tennis coach 🎾 Exploring the human mind, one theory at a time. Always ready to rally! #MindAndMovement"
)

user7_url = "https://static.independent.co.uk/2023/02/08/11/newFile-3.jpg"
user7_file = URI.open(user7_url)
user7.photo.attach(io: user7_file, filename: 'user7_img.jpeg', content_type: 'image/png')
user7.save!

user8 = User.create!(
  email: "user8@gmail.com",
  password: 'password123',
  password_confirmation: 'password123',
  first_name: "Bjorn",
  last_name: "Smashborg",
  username: "BjornTheBuilder",
  gender: "Male",
  bio: "Mechanical engineering major and dedicated padel fan! 🔧 Building skills both in class and on the court. Ready to innovate! #FutureEngineer"
)

user8_url = "https://upload.wikimedia.org/wikipedia/commons/d/d5/Bj%C3%B6rn_Borg_%281987%29_color.jpg"
user8_file = URI.open(user8_url)
user8.photo.attach(io: user8_file, filename: 'user8_img.jpeg', content_type: 'image/png')
user8.save!



puts "Succesfully generated #{User.count} users"
