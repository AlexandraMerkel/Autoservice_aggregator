# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

service1 = Service.create(service_name: 'Автопилот', service_type: [0, 1, 2, 3, 5],
  service_address: 'Москва, ул. Беломорская, 40с18', service_phonenumber: '74954888926')
service2 = Service.create(service_name: 'Мосмоторс', service_type: [0, 4, 6, 7],
  service_address: 'Москва, ул. Мневники, 1с2', service_phonenumber: '74951118268')
service3 = Service.create(service_name: 'Питстоп', service_type: [0, 1, 2, 3, 4, 5, 6],
  service_address: 'Москва, ул. Ливенская, 11', service_phonenumber: '74997046583')
service4 = Service.create(service_name: 'Автопрофи', service_type: [1, 3, 5, 6],
  service_address: 'Москва, ул. Вавилова, 13а', service_phonenumber: '74954888132')