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
user2 = User.create!(email: 'john@gmail.com', password: '111111', reset_password_token: '222222', first_name: 'John', last_name: 'FABRET', patient: false)
user3 = User.create(email: 'barbara@gmail.com', password: '222222', reset_password_token: '333333', first_name: 'Barbara', last_name: 'GOUET',patient: true)
user4 = User.create(email: 'sara@gmail.com', password: '333333', reset_password_token: '4444444', first_name: 'Sara', last_name: 'TATIN',patient: true)
user5 = User.create(email: 'alexis@gmail.com', password: '444444', reset_password_token: '555555', first_name: 'Alexis', last_name: 'QUEBET',patient: true)
puts 'User created!'

puts 'creating prescription1'
# FOR USER 1
prescription1 = Prescription.create(title: 'Ordonnance Cardio', description: 'pour mon hypertension', start_date: Date.new(2023, 07, 02), end_date: Date.new(2023, 07, 30), practician: 'Dr HOUSE', user: user1)
puts 'creating prescription2'
prescription2 = Prescription.create(title: 'Ordonnance Endocrinologue', description: "pour mon diabete", start_date: Date.new(2023, 06, 13), end_date: Date.new(2023, 07, 19), practician: 'Dr GUERIN', user: user1)
puts 'creating prescription3'
prescription3 = Prescription.create(title: 'Ordonnance Pulmonaire', description: "pour mes crises d'asthme", start_date: Date.new(2023, 06, 13), end_date: Date.new(2023, 07, 19), practician: 'Dr DRE', user: user1)
puts 'creating prescription4'
prescription4 = Prescription.create(title: 'Ordonnance Dermatologie', description: 'traitement infection talon', start_date: Date.new(2023, 02, 20), end_date: Date.new(2023, 02, 28), practician: 'Dr ROSS', user: user1)
# FOR USER 2
puts 'prescriptions created!'

puts 'creating 2 measures for user 1 et prescription 1'
# FOR USER 1 ET PRESCRIPTION 1
measure1 = Measure.create!(title: "Prise de tension", description: "Le matin et au repos", start_date: Date.new(2023, 06, 02), end_date: Date.new(2023, 07, 30), day_frequency: 1, hourly_frequency: 3, prescription: prescription1)
puts 'creating measure2'
measure2 = Measure.create!(title: "Glycémie", description: "2 hrs après le repas", start_date: Date.new(2023, 07, 02), end_date: Date.new(2023, 07, 30), day_frequency: 1, hourly_frequency: 3, prescription: prescription2)
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
follow_up1 = FollowUp.create!(title: 'Medicament Aldactone ', description: 'A prendre le matin au réveil', start_date: Date.new(2023, 04, 04), end_date: Date.new(2023, 07, 30), hourly_frequency: 3, day_frequency: 1, prescription: prescription1)
follow_up2 = FollowUp.create!(title: 'Medicament warfarine', description: 'A prendre le soir avant de dormir', start_date: Date.new(2023, 02, 04), end_date: Date.new(2023, 02, 20), hourly_frequency: 3, day_frequency: 1, prescription: prescription1)

#POUR PRESCRIPTION 2
follow_up3 = FollowUp.create(title: 'Pompe cortico', description: "A l'effort", start_date: '2023/03/11', end_date: '2023/03/17', hourly_frequency: 3, day_frequency: 2, prescription: prescription3)
puts 'done'


puts '2 creating measurement'
measurement1 = Measurement.create!(value: "140", unit: "mmHg", measure: measure1, created_at: measure1.start_date)
measurement2 = Measurement.create!(value: "135", unit: "mmHg", measure: measure1, created_at: measure1.start_date + 1.day)
measurement3 = Measurement.create!(value: "120", unit: "mmHg", measure: measure1, created_at: measure1.start_date + 2.day)
measurement4 = Measurement.create!(value: "125", unit: "mmHg", measure: measure1, created_at: measure1.start_date + 3.day)
measurement5 = Measurement.create!(value: "130", unit: "mmHg", measure: measure1, created_at: measure1.start_date + 4.day)
measurement6 = Measurement.create!(value: "140", unit: "mmHg", measure: measure1, created_at: measure1.start_date + 5.day)
measurement7 = Measurement.create!(value: "145", unit: "mmHg", measure: measure1, created_at: measure1.start_date + 6.day)
measurement8 = Measurement.create!(value: "135", unit: "mmHg", measure: measure1, created_at: measure1.start_date + 7.day)
measurement9 = Measurement.create!(value: "140", unit: "mmHg", measure: measure1, created_at: measure1.start_date + 8.day)
measurement10 = Measurement.create!(value: "120", unit: "mmHg", measure: measure1, created_at: measure1.start_date + 9.day)
measurement11 = Measurement.create!(value: "135", unit: "mmHg", measure: measure1, created_at: measure1.start_date + 10.day)
measurement12 = Measurement.create!(value: "140", unit: "mmHg", measure: measure1, created_at: measure1.start_date + 11.day)
measurement13 = Measurement.create!(value: "140", unit: "mmHg", measure: measure1, created_at: measure1.start_date + 12.day)
measurement14 = Measurement.create!(value: "125", unit: "mmHg", measure: measure1, created_at: measure1.start_date + 13.day)
measurement15 = Measurement.create!(value: "140", unit: "mmHg", measure: measure1, created_at: measure1.start_date + 14.day)
measurement16 = Measurement.create!(value: "121", unit: "mmHg", measure: measure1, created_at: measure1.start_date + 15.day)
measurement17 = Measurement.create!(value: "132", unit: "mmHg", measure: measure1, created_at: measure1.start_date + 16.day)
measurement18 = Measurement.create!(value: "143", unit: "mmHg", measure: measure1, created_at: measure1.start_date + 17.day)
measurement19 = Measurement.create!(value: "154", unit: "mmHg", measure: measure1, created_at: measure1.start_date + 18.day)
measurement20 = Measurement.create!(value: "125", unit: "mmHg", measure: measure1, created_at: measure1.start_date + 19.day)
measurement21 = Measurement.create!(value: "136", unit: "mmHg", measure: measure1, created_at: measure1.start_date + 20.day)
measurement22 = Measurement.create!(value: "147", unit: "mmHg", measure: measure1, created_at: measure1.start_date + 21.day)
measurement23 = Measurement.create!(value: "158", unit: "mmHg", measure: measure1, created_at: measure1.start_date + 22.day)
measurement24 = Measurement.create!(value: "129", unit: "mmHg", measure: measure1, created_at: measure1.start_date + 23.day)
measurement25 = Measurement.create!(value: "130", unit: "mmHg", measure: measure1, created_at: measure1.start_date + 24.day)
measurement26 = Measurement.create!(value: "141", unit: "mmHg", measure: measure1, created_at: measure1.start_date + 25.day)
measurement27 = Measurement.create!(value: "152", unit: "mmHg", measure: measure1, created_at: measure1.start_date + 26.day)
measurement28 = Measurement.create!(value: "153", unit: "mmHg", measure: measure1, created_at: measure1.start_date + 27.day)
measurement29 = Measurement.create!(value: "154", unit: "mmHg", measure: measure1, created_at: measure1.start_date + 28.day)
puts "2 measurements created!"

puts '3 creating measurement'
measurement1_1 = Measurement.create!(value: "1.31", unit: "mmol", measure: measure2, created_at: measure2.start_date)
measurement1_2 = Measurement.create!(value: "1.42", unit: "mmol", measure: measure2, created_at: measure2.start_date + 1.day)
measurement1_3 = Measurement.create!(value: "1.33", unit: "mmol", measure: measure2, created_at: measure2.start_date + 2.day)
measurement1_4 = Measurement.create!(value: "1.44", unit: "mmol", measure: measure2, created_at: measure2.start_date + 3.day)
measurement1_5 = Measurement.create!(value: "1.45", unit: "mmol", measure: measure2, created_at: measure2.start_date + 4.day)
measurement1_6 = Measurement.create!(value: "1.60", unit: "mmol", measure: measure2, created_at: measure2.start_date + 5.day)
measurement1_7 = Measurement.create!(value: "1.36", unit: "mmol", measure: measure2, created_at: measure2.start_date + 6.day)
measurement1_8 = Measurement.create!(value: "1.47", unit: "mmol", measure: measure2, created_at: measure2.start_date + 7.day)
measurement1_9 = Measurement.create!(value: "1.60", unit: "mmol", measure: measure2, created_at: measure2.start_date + 8.day)
measurement1_10 = Measurement.create!(value: "1.48", unit: "mmol", measure: measure2, created_at: measure2.start_date + 9.day)
measurement1_11 = Measurement.create!(value: "1.49", unit: "mmol", measure: measure2, created_at: measure2.start_date + 10.day)
measurement1_12 = Measurement.create!(value: "1.30", unit: "mmol", measure: measure2, created_at: measure2.start_date + 11.day)
measurement1_13 = Measurement.create!(value: "1.41", unit: "mmol", measure: measure2, created_at: measure2.start_date + 12.day)
measurement1_14 = Measurement.create!(value: "1.32", unit: "mmol", measure: measure2, created_at: measure2.start_date + 13.day)
measurement1_15 = Measurement.create!(value: "1.53", unit: "mmol", measure: measure2, created_at: measure2.start_date + 14.day)
measurement1_16 = Measurement.create!(value: "1.44", unit: "mmol", measure: measure2, created_at: measure2.start_date + 15.day)
measurement1_17 = Measurement.create!(value: "1.35", unit: "mmol", measure: measure2, created_at: measure2.start_date + 16.day)
measurement1_18 = Measurement.create!(value: "1.46", unit: "mmol", measure: measure2, created_at: measure2.start_date + 17.day)
measurement1_19 = Measurement.create!(value: "1.37", unit: "mmol", measure: measure2, created_at: measure2.start_date + 18.day)
measurement1_20 = Measurement.create!(value: "1.48", unit: "mmol", measure: measure2, created_at: measure2.start_date + 19.day)
measurement1_21 = Measurement.create!(value: "1.39", unit: "mmol", measure: measure2, created_at: measure2.start_date + 20.day)
measurement1_22 = Measurement.create!(value: "1.50", unit: "mmol", measure: measure2, created_at: measure2.start_date + 21.day)
measurement1_23 = Measurement.create!(value: "1.31", unit: "mmol", measure: measure2, created_at: measure2.start_date + 22.day)
measurement1_24 = Measurement.create!(value: "1.40", unit: "mmol", measure: measure2, created_at: measure2.start_date + 23.day)
measurement1_25 = Measurement.create!(value: "1.32", unit: "mmol", measure: measure2, created_at: measure2.start_date + 24.day)
measurement1_26 = Measurement.create!(value: "1.33", unit: "mmol", measure: measure2, created_at: measure2.start_date + 25.day)
measurement1_27 = Measurement.create!(value: "1.44", unit: "mmol", measure: measure2, created_at: measure2.start_date + 26.day)
measurement1_28 = Measurement.create!(value: "1.35", unit: "mmol", measure: measure2, created_at: measure2.start_date + 27.day)
measurement1_29 = Measurement.create!(value: "1.36", unit: "mmol", measure: measure2, created_at: measure2.start_date + 28.day)
puts "3 measurements created!"

appointment1 = Appointment.create!(title: 'Cardio', appointment_date: Date.new(2023, 07, 07), appointment_time: Time.now, address: "Place de l'ecureuil", user: user1)
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
