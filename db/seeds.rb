require 'date'

puts "Cleaning database.."

Booking.destroy_all
Flat.destroy_all
User.destroy_all

puts "Creating database.."

# USER CREATION
start_date = Date.today
ro_user = User.create!(password: "123456", email: "ropicaza@gmail.com")
tom_user = User.create!(password: "123456", email: "tomagnese@gmail.com")
joaco_user = User.create!(password: "123456", email: "joacocasanova@gmail.com")
guido_user = User.create!(password: "123456", email: "guidotiba@gmail.com")
juan_user = User.create!(password: "123456", email: "juanperez@gmail.com")
claudio_user = User.create!(password: "123456", email: "clauperez@gmail.com")
owner_user = User.create!(password: "123456", email: "ownerperez@gmail.com")

# IMAGES
ro_flat_images = ["https://res.cloudinary.com/divzp8hs4/image/upload/v1611970696/Airbnb-clone/naomi-hebert-MP0bgaS_d1c-unsplash_v1szud.jpg", "https://res.cloudinary.com/divzp8hs4/image/upload/v1611970694/Airbnb-clone/douglas-sheppard-9rYfG8sWRVo-unsplash_lopwx2.jpg", "https://res.cloudinary.com/divzp8hs4/image/upload/v1611970692/Airbnb-clone/depto_3_a4mbpr.jpg", "https://res.cloudinary.com/divzp8hs4/image/upload/v1611970692/Airbnb-clone/living_4_vgldlu.jpg", "https://res.cloudinary.com/divzp8hs4/image/upload/v1611970691/Airbnb-clone/bedroom_lhwbtt.jpg"]

ro_flat_images2 = ["https://res.cloudinary.com/divzp8hs4/image/upload/v1611970694/Airbnb-clone/douglas-sheppard-9rYfG8sWRVo-unsplash_lopwx2.jpg", "https://res.cloudinary.com/divzp8hs4/image/upload/v1611970692/Airbnb-clone/depto_3_a4mbpr.jpg", "https://res.cloudinary.com/divzp8hs4/image/upload/v1611970692/Airbnb-clone/living_4_vgldlu.jpg", "https://res.cloudinary.com/divzp8hs4/image/upload/v1611970691/Airbnb-clone/bedroom_lhwbtt.jpg"]

ro_flat_images3 = ["https://res.cloudinary.com/divzp8hs4/image/upload/v1611970692/Airbnb-clone/depto_3_a4mbpr.jpg", "https://res.cloudinary.com/divzp8hs4/image/upload/v1611970692/Airbnb-clone/living_4_vgldlu.jpg", "https://res.cloudinary.com/divzp8hs4/image/upload/v1611970691/Airbnb-clone/bedroom_lhwbtt.jpg"]

ro_flat_images4 = ["https://res.cloudinary.com/divzp8hs4/image/upload/v1611970692/Airbnb-clone/living_4_vgldlu.jpg", "https://res.cloudinary.com/divzp8hs4/image/upload/v1611970691/Airbnb-clone/bedroom_lhwbtt.jpg"]

ro_flat_images5 = ["https://res.cloudinary.com/divzp8hs4/image/upload/v1611970691/Airbnb-clone/bedroom_lhwbtt.jpg"]


# FLATS CREATION
ro_flat = Flat.create!(name: "cálido 3 amb", description: "Hermoso 3 ambientes en privilegiada zona de Palermo. Departamento muy luminoso, al frente. Ideal para quien busca tranquilidad!", price: "200", location: "Palermo", owner: ro_user, wifi: true, pool: false, bathroom: 1, bedroom: 2, rating: 4, address: "Humboldt 2120, Buenos Aires, Ciudad Autónoma de Buenos Aires, Argentina", guests: 2)

owner_flat = Flat.create!(name: "Gran Estudio", description: "Luminoso estudio en una de las zonas mas vibrantes del barrio de Palermo", price: "400", location: "Palermo", owner: owner_user, wifi: true, pool: true, bathroom: 2, bedroom: 3, rating: 4, address: "Paraguay 5301, Buenos Aires, Ciudad Autónoma de Buenos Aires, Argentina", guests: 2)

owner_flat1 = Flat.create!(name: "Exclusivo departamento", description: "Muebles de categoría, muy confortables, ideales para relajarse después de recorrer la ciudad de Buenos Aires.", price: "150", location: "Palermo", owner: owner_user, wifi: true, pool: false, bathroom: 1, bedroom: 2, rating: 2, address: "Bonpland 1874, Buenos Aires, Ciudad Autónoma de Buenos Aires, Argentina", guests: 2)

owner_flat2 = Flat.create!(name: "Boutique Loft 2 ambientes", description: "Te esperamos en este loft de diseño único, ubicado en la mejor zona de Palermo Hollywood.", price: "225", location: "Palermo", owner: owner_user, wifi: true, pool: false, bathroom: 1, bedroom: 1, rating: 4, address: "Fitz Roy 1834, Buenos Aires, Ciudad Autónoma de Buenos Aires, Argentina", guests: 2)

owner_flat3 = Flat.create!(name: "Luminoso monoamb", description: "Acogedor departamento en el centro de Palermo. Llama la atención por su tranquilidad y su luminosidad.", price: "100", location: "Palermo", owner: owner_user, wifi: true, pool: false, bathroom: 1, bedroom: 1, rating: 4, address: "Soler 5608, Buenos Aires, Ciudad Autónoma de Buenos Aires, Argentina", guests: 2)

# IMAGES ATTACHING
ro_flat_images.each do |img|
  ro_img_file = URI.open(img)
  ro_flat.photos.attach(io: ro_img_file, filename: 'flat_img.png', content_type: 'image/png')
  ro_flat.save
end

ro_flat_images2.each do |img|
  ro_img_file = URI.open(img)
  owner_flat.photos.attach(io: ro_img_file, filename: 'flat_img.png', content_type: 'image/png')
  owner_flat.save
end

ro_flat_images3.each do |img|
  ro_img_file = URI.open(img)
  owner_flat1.photos.attach(io: ro_img_file, filename: 'flat_img.png', content_type: 'image/png')
  owner_flat1.save
end

ro_flat_images4.each do |img|
  ro_img_file = URI.open(img)
  owner_flat2.photos.attach(io: ro_img_file, filename: 'flat_img.png', content_type: 'image/png')
  owner_flat2.save
end

ro_flat_images5.each do |img|
  ro_img_file = URI.open(img)
  owner_flat3.photos.attach(io: ro_img_file, filename: 'flat_img.png', content_type: 'image/png')
  owner_flat3.save
end

# BOOKINGS CREATION
joaco_experience = Booking.create!(renter: joaco_user, flat: ro_flat, start_date: start_date - 30.days, end_date: start_date - 20.days, status: "accepted")
guido_experience = Booking.create!(renter: guido_user, flat: ro_flat, start_date: start_date - 100.days, end_date: start_date - 90.days, status: "accepted")
guido_experience1 = Booking.create!(renter: guido_user, flat: owner_flat, start_date: start_date - 100.days, end_date: start_date - 90.days, status: "accepted")
juan_experience = Booking.create!(renter: juan_user, flat: ro_flat, start_date: start_date - 200.days, end_date: start_date - 180.days, status: "accepted")
claudio_experience = Booking.create!(renter: claudio_user, flat: ro_flat, start_date: start_date - 200.days, end_date: start_date - 180.days, status: "accepted")


# REVIEWS CREATION
Booking.create!(renter: guido_user, flat: ro_flat, start_date: start_date + 30.days, end_date: start_date + 40.days, status: "pending")

Booking.create!(renter: guido_user, flat: owner_flat, start_date: start_date - 30.days, end_date: start_date + 2.days, status: "accepted")

Review.create!(user: ro_user, booking: guido_experience, content: "Guido fue muy amable", rating: 5)

Review.create!(user: ro_user, booking: guido_experience, content: "La persona dejo el  lugar muy sucio", rating: 2)

Review.create!(user: juan_user, booking: juan_experience, content: "Me gusto mucho el departamento. La dueña es una genia me dejo todo impecable. La zona es excelente ya que el barrio tiene mucha vida nocturna!", rating: 5)

Review.create!(user: joaco_user, booking: joaco_experience, content: "El departamento estaba en excelentes condiciones! Ubicado en pleno corazón del barrio de Palermo. Ideal para trabajar tranquilo o ir por una cerveza!", rating: 4)

Review.create!(user: claudio_user, booking: claudio_experience, content: "Muy lindo departamento. Ideal para recorrer la ciudad a pie. Barrio seguro, excelente opcion para turistas! No se van a arrepentir!", rating: 5)


puts "Owner: #{Booking.last.flat.owner.email} - ID: #{Booking.last.flat.owner.id}"
puts "Renter: #{Booking.last.renter.email} - ID: #{Booking.last.renter.id}"