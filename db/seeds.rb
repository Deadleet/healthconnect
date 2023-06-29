# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
PathoPrescription.destroy_all
FollowUp.destroy_all
Measure.destroy_all
Pathologie.destroy_all
Prescription.destroy_all
User.destroy_all

puts 'creating user'
user1 = User.create(email: 'healthconnect@gmail.com', password: '123456', reset_password_token: '234567', first_name: 'Health', last_name: 'Connect',patient: true)
user2 = User.create(email: 'john@gmail.com', password: '333333', reset_password_token: '444444', first_name: 'John', last_name: 'Fabiani',patient: false)
user3 = User.create(email: 'barbara@gmail.com', password: '654321', reset_password_token: '765432', first_name: 'Barbara', last_name: 'Guerin',patient: true)
user4 = User.create(email: 'sara@gmail.com', password: '111111', reset_password_token: '222222', first_name: 'sara', last_name: 'Quebec',patient: true)
puts 'User created!'

puts 'creating prescription1'
# FOR USER 1
prescription1 = Prescription.create(title: 'Ordonnance Cardio', description: 'pour mon hypertension', start_date: Date.new(2023, 02, 12), end_date: Date.new(2023, 03, 18), practician: 'DR House', user: user1)
puts 'creating prescription2'
prescription2 = Prescription.create(title: 'Ordonnance Poulmonaire', description: "pour mes crises d'asthme", start_date: Date.new(2023, 03, 13), end_date: Date.new(2023, 03, 19), practician: 'DR House2', user: user1)
puts 'creating prescription3'
prescription3 = Prescription.create(title: 'Ordonnance Dermatologie', description: 'traitement infection talon', start_date: Date.new(2023, 02, 20), end_date: Date.new(2023, 02, 28), practician: 'DR House3', user: user1)
# FOR USER 2
puts 'prescriptions created!'

measure1 = Measure.create!(title: "Prise de tension", description: "Prendre la tension", start_date: Date.new(2023, 06, 27), end_date: Date.new(2023, 06, 30), day_frequency: 1, hourly_frequency: 3, prescription: prescription1)

puts 'creating pathologie'
# FOR USER 1
pathologie1 = Pathologie.create(name:'Hypertension', description: "A l'effort", user: user1)
pathologie2 = Pathologie.create(name:'Asthme', description: 'Le matin', user: user1)
pathologie3 = Pathologie.create(name:'Infection cuatanée', description:'infection', user: user1)
# FOR USER 2

puts 'pathologies created!'

# puts 'creating patho-prescription'
# pathoprescription1 = PathoPrescription.create(pathologie: Pathologie.last, prescription: Prescription.last)
# pathoprescription2 = PathoPrescription.create(pathologie: Pathologie.last, prescription: Prescription.last)
# pathoprescription3 = PathoPrescription.create(pathologie: Pathologie.last, prescription: Prescription.last)
# puts 'patho-prescription created!'

puts 'creating follow-up'
# POUR PRESCRIPTION 1
follow_up1 = FollowUp.create!(title: 'Medicament Aldactone ', description: 'A prendre le matin avant le petit-dej', start_date: Date.new(2023, 04, 04), end_date: Date.new(2023, 05, 13), hourly_frequency: 3, day_frequency: 1, prescription: prescription1)
follow_up2 = FollowUp.create!(title: 'Medicament warfarine', description: 'A prendre le soir', start_date: Date.new(2023, 02, 04), end_date: Date.new(2023, 02, 20), hourly_frequency: 3, day_frequency: 1, prescription: prescription1)

#POUR PRESCRIPTION 2
follow_up3 = FollowUp.create(title: 'Pompe cortico', description: "A l'effort", start_date: '2023/03/11', end_date: '2023/03/17', hourly_frequency: 3, day_frequency: 2, prescription: prescription2)
puts 'done'
