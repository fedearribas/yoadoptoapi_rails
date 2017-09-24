# Adoption.create!(
#  name: "Eru",
#  age: 4,
#  age_measurement_unit: "Años",
#  image: "http://www.petmd.com/sites/default/files/what-does-it-mean-when-cat-wags-tail.jpg",
#  adopted: false,
#  description: "Hermoso gatito",
#  published_date: Date.current(),
#  contact_phone: 155117310,
#  contact_email: "test@test.com"
# )

# Adoption.create!(
#  name: "Chango",
#  age: 10,
#  age_measurement_unit: "Años",
#  image: "http://librecatamarca.com.ar/press/wp-content/uploads/2014/09/ovejero.jpg",
#  adopted: false,
#  description: "Hermoso perro",
#  published_date: Date.current(),
#  contact_phone: 155117310,
#  contact_email: "test@test.com"
# )
User.create!(email: 'admin@test.com', nickname: 'admin', name: 'Admin', password: "fede1234")