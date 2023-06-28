# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Prescription.destroy_all
Pathologie.destroy_all
PathoPrescription.destroy_all
FollowUp.destroy_all
User.destroy_all

User.create(email: 'emeline@gmail.com', password: '333333', reset_password_token: '444444', first_name: 'cemeline', last_name: 'fabiani',patient: false,)



User.create(email: 'healthconnect@gmail.com', password: '123456', reset_password_token: '234567', first_name: 'Health', last_name: 'Connect',patient: true,)
Prescription.create(title: 'maladie', description: 'traitement de la maladie', start_date: '2023/03/12', end_date: '2O23/03/18', practician: 'DR House', user: User.last)
Pathologie.create(name:'maladie', description:'description maladie', user: User.last)
PathoPrescription.create(pathologie: Pathologie.last, prescription: Prescription.last)
FollowUp.create(title: 'maladie', description: 'traitement de la maladie', start_date: '2023/03/12', end_date: '2023/03/18', hourly_frequency: 3, day_frequency: 1,prescription: Prescription.last)




User.create(email: 'thomas@gmail.com', password: '654321', reset_password_token: '765432', first_name: 'thomas', last_name: 'guerin',patient: true,)
Prescription.create(title: 'maladie2', description: 'traitement de la maladie2', start_date: '2023/03/13', end_date: '2O23/03/19', practician: 'DR House2', user: User.last)
Pathologie.create(name:'maladie#1', description:'description maladie#1', user: User.last)
PathoPrescription.create(pathologie: Pathologie.last, prescription: Prescription.last)
FollowUp.create(title: 'maladie#0', description: 'traitement de la maladie#0', start_date: '2023/03/11', end_date: '2023/03/17', hourly_frequency: 3, day_frequency: 2,prescription: Prescription.last)




User.create(email: 'clemence@gmail.com', password: '111111', reset_password_token: '222222', first_name: 'clemence', last_name: 'quebec',patient: true,)
Prescription.create(title: 'maladie3', description: 'traitement de la maladie3', start_date: '2023/03/14', end_date: '2O23/03/20', practician: 'DR House3', user: User.last)
Pathologie.create(name:'maladie#2', description:'description maladie#2', user: User.last)
PathoPrescription.create(pathologie: Pathologie.last, prescription: Prescription.last)
FollowUp.create(title: 'maladie#', description: 'traitement de la maladie#', start_date: '2023/03/10', end_date: '2023/03/16', hourly_frequency: 3, day_frequency: 1,prescription: Prescription.last)
