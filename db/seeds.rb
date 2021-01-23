require 'date'

puts "Cleaning database.."

Booking.destroy_all
Flat.destroy_all
User.destroy_all

puts "Creating database.."

number_of_users = 8
renters = []
owners = []
number_of_users.times do |i|
  user = User.create!(password: "123456", email: "user#{i}@gmail.com")
  if i > number_of_users / 2
    owners << user
    rand(2).times do
      Flat.create!(name: "Depto#{n}", description: "desc1", price: rand(50..100), location: "location1", owner: owners.sample)
      rand(5).times do
        start_date = Date.today + rand(3..15).days
        Booking.create!(renter: renters.sample, flat: Flat.last, start_date: start_date, end_date: start_date + rand(3..15).days, status: "pending" )
      end
    end
  else
    renters << user
  end
end

puts "Owner: #{owners.sample.email}"
puts "Renter: #{renter.sample.email}"