require "open-uri"

PathoPrescription.destroy_all
FollowUp.destroy_all
Measure.destroy_all
Pathologie.destroy_all
Prescription.destroy_all
Appointment.destroy_all
User.destroy_all

puts 'creating user'
user1 = User.create(email: 'healthconnect@gmail.com', password: '123456', reset_password_token: '654321', first_name: 'Josephine', last_name: 'BALDIN',patient: true)
user2 = User.create(email: 'john@gmail.com', password: '111111', reset_password_token: '222222', first_name: 'John', last_name: 'FABRET',patient: false)
user3 = User.create(email: 'barbara@gmail.com', password: '222222', reset_password_token: '333333', first_name: 'Barbara', last_name: 'GOUET',patient: true)
user4 = User.create(email: 'sara@gmail.com', password: '333333', reset_password_token: '4444444', first_name: 'Sara', last_name: 'TATIN',patient: true)
user5 = User.create(email: 'alexis@gmail.com', password: '444444', reset_password_token: '555555', first_name: 'Alexis', last_name: 'QUEBET',patient: true)
puts 'User created!'

puts 'creating prescription1'
# FOR USER 1
prescription1 = Prescription.create(title: 'Ordonnance Cardio', description: 'pour mon hypertension', start_date: Date.new(2023, 07, 02), end_date: Date.new(2023, 07, 30), practician: 'DR House', user: user1)
puts 'creating prescription2'
prescription2 = Prescription.create(title: 'Ordonnance Endocrinologue', description: "pour mon diabete", start_date: Date.new(2023, 06, 13), end_date: Date.new(2023, 07, 19), practician: 'DR House2', user: user1)
puts 'creating prescription3'
prescription3 = Prescription.create(title: 'Ordonnance Poulmonaire', description: "pour mes crises d'asthme", start_date: Date.new(2023, 06, 13), end_date: Date.new(2023, 07, 19), practician: 'DR House2', user: user1)
puts 'creating prescription4'
prescription4 = Prescription.create(title: 'Ordonnance Dermatologie', description: 'traitement infection talon', start_date: Date.new(2023, 02, 20), end_date: Date.new(2023, 02, 28), practician: 'DR House3', user: user1)
# FOR USER 2
puts 'prescriptions created!'

puts 'creating 2 measures for user 1 et prescription 1'
# FOR USER 1 ET PRESCRIPTION 1
measure1 = Measure.create!(title: "Prise de tension", description: "Prendre la tension", start_date: Date.new(2023, 07, 02), end_date: Date.new(2023, 07, 30), day_frequency: 1, hourly_frequency: 3, prescription: prescription1)
puts 'creating measure2'
measure1 = Measure.create!(title: "Glycémie", description: "2 hrs après le repas", start_date: Date.new(2023, 07, 02), end_date: Date.new(2023, 07, 30), day_frequency: 1, hourly_frequency: 3, prescription: prescription2)
puts 'measures created!'


puts 'creating 3 pathologies'
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

puts 'creating 2 follow-up'
# POUR PRESCRIPTION 1
follow_up1 = FollowUp.create!(title: 'Medicament Aldactone ', description: 'A prendre le matin avant le petit-dej', start_date: Date.new(2023, 04, 04), end_date: Date.new(2023, 05, 13), hourly_frequency: 3, day_frequency: 1, prescription: prescription1)
follow_up2 = FollowUp.create!(title: 'Medicament warfarine', description: 'A prendre le soir', start_date: Date.new(2023, 02, 04), end_date: Date.new(2023, 02, 20), hourly_frequency: 3, day_frequency: 1, prescription: prescription1)

#POUR PRESCRIPTION 2
follow_up3 = FollowUp.create(title: 'Pompe cortico', description: "A l'effort", start_date: '2023/03/11', end_date: '2023/03/17', hourly_frequency: 3, day_frequency: 2, prescription: prescription3)
puts 'done'


puts '2 creating measurement'
measurement1 = Measurement.create!(value: "140/90", unit: "mmHg", measure: measure1)
measurement2 = Measurement.create!(value: "150/90", unit: "mmHg", measure: measure1)
puts "2 measurements created!"

appointment1 = Appointment.create!(title: 'Dentiste', appointment_date: Date.new(2023, 03, 11), appointment_time: Time.now, address: "Place de l'ecureuil", user: user1, practician: user5)
puts 'done'


# Booking.destroy_all
# Tent.destroy_all
# User.destroy_all

# puts "create user"

# patrick = User.create!(first_name: "Patrick", email: "patrick.amazing@gmail.com", password: "patrick")
# patrick_file = URI.open("https://images.pexels.com/photos/17013946/pexels-photo-17013946/free-photo-of-fashion-man-people-dark.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load")
# patrick.photo.attach(io: patrick_file, filename: "patrick.png", content_type: "image/jpg")
# patrick.save!

# puts "create tent"
# tent1 = Tent.create!(name: "Lake House Tent", description: "Amazing view on the lake", address: "31 lake street", price: 150, user: josephine)
# tent1_file = URI.open("https://images.pexels.com/photos/45241/tent-camp-night-star-45241.jpeg?auto=compress&cs=tinysrgb&w=800")
# tent1.photo.attach(io: tent1_file, filename: "tent1.png", content_type: "image/jpg")
# tent1.save!

# tent2 = Tent.create!(name: "Ocean House Tent", description: "Great view on the ocean", address: "31 ocean street", price: 200, user: josephine )
# tent2_file = URI.open("https://images.pexels.com/photos/1687845/pexels-photo-1687845.jpeg?auto=compress&cs=tinysrgb&w=800")
# tent2.photo.attach(io: tent2_file, filename: "tent2.png", content_type: "image/jpg")
# tent2.save!

# tent3 = Tent.create!(name: "River House Tent", description: "Beautiful view on the river", address: "31 river street", price: 90, user: patrick)
# tent3_file = URI.open("https://images.pexels.com/photos/803226/pexels-photo-803226.jpeg?auto=compress&cs=tinysrgb&w=800")
# tent3.photo.attach(io: tent3_file, filename: "tent3.png", content_type: "image/jpg")
# tent3.save!
# puts "Finished tent!"
