require 'date'

puts "Cleaning database.."

Booking.destroy_all
Flat.destroy_all
User.destroy_all

puts "Creating database.."

FLAT_NAME = ["TU LUGAR EN EL CORAZÓN DE BUENOS AIRES", "COZY STUDIO WITH TERRACE IN BORN", "Cozy design apartment in the center", "SLEEP Universitat 1 Bedroom 1 Bathroom Apartment", "3 rooms, 2 bathrooms in the touristic city centre", "Diseño y tranquilidad", "Find Calm at a Neutral City Sanctuary with Sleek Style", "Spectacular Penthouse 2BR with River&Sunrise views", "Faena Apart", "Design-Savvy Apartment", "Excelente departamento tipo dúplex equipado", "BOUTIQUE LOFT", "SOLER ART STUDIOS", "Unforgettable Loft", "Espacio Guatemala"]

FLAT_LOCATION = ["Palermo", "Microcentro", "Puerto Madero", "Almagro", "Belgrano", "Nuñez", "Saavedra", "Villa Urquiza", "Balvanera", "Caballito", "San Telmo", "Recoleta", "Retiro", "Montserrat", "Barrio Norte", "Flores", "Paternal", "Villa Crespo", "San Nicolas", "Colegiales"]

FLAT_DESCRIPTION = ["Amplio y luminoso departamento tipo Loft equipado para alquiler temporario, tiene una moderna cocina abierta al comedor y sala integrados, con baño con ducha, internet, tv, tele por cable, aire acondicionado frío-calor, sofá cama, mesa alta de comedor, caja de seguridad, luz de emergencia, detalles de categoría, decoración moderna y conectado por el transporte público a toda la capital. Recientemente refaccionado a nuevo !", "Hermoso departamento ubicado en PALERMO HOLLYWOOD!! Equipado para pasar una estadía excepcional. Cuenta con una cama King Size, Smart TV, toallas, sabanas, cafetera, microondas, pava eléctrica, utensilios de cocina y todo lo necesario para que te sientas como en tu casa.", "Depto con terraza propia en torre de lujo. Piscina, Laundry, Gimnasio y Quincho con vista panorámica. Seguridad 24 hs. A estrenar. Zona turística. Pasos de Palermo, Subte B, y Plaza Serrano. Bares, locales de ropa, transportes. Silencioso Habitación en Suite con cama queen size. Living con sofá cama cómodo y práctico para armar dos camas individuales. Toilette. Placards, Smart tv, WiFi, aire acondicionado en living y calefacción. Cocina totalmente equipada. *Amenities habilitados con protocolo", "Departamento cómodo con cochera. Cuenta con espacios bien distribuidos (living, cocina-comedor, vanitory y baño), de buen confort totalmente equipado para satisfacer sus necesidades. Ademas ofrecemos servicio de wi-fi, cable satelital y desayunos de cortesía. Estamos a 8 cuadras de la plaza.A la hora de tu llegada te buscamos y te acompañamos a instalarte. Gracias!!!", "Es un muy lindo departamento ubicado en piso 6 al frente con muy buena iluminación todo el día. Es dúplex, encontrándose el dormitorio en la planta alta del departamento y se accede por una amplia escalera. El departamento está totalmente equipado con TV, microondas, horno, hornallas eléctricas (anafe), heladera, WIFI, cable HD y todo lo necesario para disfrutar de su estadía.", "Departamento nuevo, amoblado y decorado para recibir huéspedes. Ubicado en Las Heras y Azcuénaga, cerca de parques, subte, museos, restaurantes, cervecerías, mall y el célebre cementerio. Pueden quedarse hasta 3 personas; una cama matrimonial en la habitación y un sofá cama en el living. Sábanas y toallas incluídas / WIFI / Smart TV con cable.", "Studio super luminoso en el centro de Palermo Soho, sin duda la mejor de la ciudad en cuanto a negocios de diseño, restaurants, atracciones turísticas diarias, bares y vida nocturna. A pocos pasos del subte entre plaza Serrano y la Rural. Tiene una cama matrimonial super cómoda y una practicuna. Por lo que alberga perfectamente 2 personas y un bebé. Además cuenta con pileta, Laundry y Parrilla en la terraza. ", "Excelente departamento ubicado en PALERMO!! Súper equipado!! Cama KING SIZE, SMART TV, ropa de cama, toallas, cafetera, microondas, heladera, tostadora, pava eléctrica, utensilios de cocina, plancha y todo lo necesario para que te sientas como en tu casa!!.", "Hermoso departamento ubicado en PALERMO HOLLYWOOD!!", " Equipado para pasar una estadía excepcional. Cuenta con una cama matrimonial, tv 32 pulgadas, toallas, sabanas, cafetera, horno eléctrico, pava eléctrica, utensilios de cocina y todo lo necesario para que te sientas como en tu casa.", "Ideal!grill, pool, sun. Apt babies Palermo Soho", "The Loft, 5 years old, has brand new furniture and appliances. It is 60 aprox square meter, full of light and luminosity. On the first level it has a kitchen, a toilet, and a living room, with TV, and a sofa, a table and 4 chairs. It has a balcony. On the 2nd floor it has a comfortable queen bed, a wardrobe, and bathroom.", "Te esperamos en este loft de diseño único, ubicado en la mejor zona de Palermo Hollywood. Con una vista abierta al increíble jardín del edificio, que cuenta con piscina, gimnasio y sauna.", "Ubicacion- Ubicacion-Ubicacion, Hermoso departamento lleno de diseño y arquitectura única en el corazón de PALERMO. En la misma calle que plaza ARMENIA, llena de bares, locales y la mejor zona gastronómica de la Ciudad, las mejores heladerias y hamburgueserias de la ciudad a máximo 3 cuadras de distancia.", "Luminoso estudio en una de las zonas mas vibrantes del barrio de Palermo, Scalabrini Ortiz y Gorriti.", "Start the day with Estudio Libertad toiletries in the subway-tiled bathroom, a cup of Nespresso to hand.", "Un espacio totalmente pensado para que su estadía sea excelente!! Lleno de luz, ubicado en un barrio privilegiado de la Ciudad de Buenos Aires. Variedad de medios de transporte para trasladarse por la ciudad, restaurantes, bares, shoppings, outlets, espacios verdes, hipódromo y mucho más.", "Hermoso departamento ubicado en PALERMO HOLLYWOOD!! Equipado para pasar una estadía excepcional. Cuenta con una cama matrimonial, tv 32 pulgadas, toallas, sabanas, cafetera, horno eléctrico, pava eléctrica, utensilios de cocina y todo lo necesario para que te sientas como en tu casa."]

number_of_users = 8
renters = []
owners = []
number_of_users.times do |i|
  user = User.create!(password: "123456", email: "user#{i}@gmail.com")
  if i > number_of_users / 2
    owners << user
    rand(1..3).times do
      Flat.create!(name: FLAT_NAME.sample, description: FLAT_DESCRIPTION.sample, price: rand(50..100), location: FLAT_LOCATION.sample, owner: owners.sample)
      rand(2..5).times do
        start_date = Date.today + rand(3..15).days
        Booking.create!(renter: renters.sample, flat: Flat.last, start_date: start_date, end_date: start_date + rand(3..15).days, status: "pending" )
      end
    end
  else
    renters << user
  end
end

puts "Owner: #{Booking.last.flat.owner.email} - ID: #{Booking.last.flat.owner.id}"
puts "Renter: #{Booking.last.renter.email} - ID: #{Booking.last.renter.id}"