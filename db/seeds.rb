gem 'pry-byebug'


# Users
p 'Seeding Users'
users = ['James Smith', 'Adam Peters', 'Valentine Müller', 'Fred Jones', 'Ivo Waznyak', 'Nick Jones', 'Peter Dickson', 'Lawrence Andrews', 'Andrew Franco', 'Chris Faria', 'Lara Johnson', 'Ruby Jones', 'Sarah Johnson']

users.each do |user|
  first_name = user.split[0]
  last_name = user.split[1]
  User.create({first_name: first_name, last_name: last_name, email: "#{first_name}.#{last_name}@example.com", password: '123456'})
end

def find_user
  i = rand(1..User.all.length)
  user = User.find_by(id: i)
  user.id
end

# Apartments
p 'Seeding Apartments'
apartments = [
  {name: 'The Pad', address: '24 Wilhelmstr, Berlin, 10523', user_id: find_user},
  {name: 'Home', address: '15 Schillerstr, Berlin, 10434', user_id: find_user },
  {name: 'No Name', address: '4 Grolmanstr, Berlin, 10987', user_id: find_user }
]

apartments.each do |apartment|
  Apartment.create(apartment)
end

# Bills
p 'Seeding Bills'
bills = [
  {name: 'Beers', user_id: find_user, description: 'Beers at the pub', value: 125, apartment: true },
  {name: 'Washing Machine', user_id: find_user, description: 'New Washing Machine in the WG', value: 450, apartment: true },
  {name: 'IOU', user_id: find_user, description: 'Money I borrowed from last week', value: 4.50 },
  {name: 'Cleaning Bill', user_id: find_user, description: 'Cleaning of apartment from Party', value: 150, apartment: true },
  {name: 'Vinyl Player', user_id: find_user, description: 'Our new Bougy AF Vinyl Player', value: 85, apartment: true },
  {name: 'Dinner at Cái', user_id: find_user, description: 'Split bill eating out', value: 55 },
  {name: 'Party Beers', user_id: find_user, description: 'Beers and food for last weeks party', value: 212, apartment: true },
  {name: 'New WG Bike', user_id: find_user, description: 'The new WG Bike', value: 32, apartment: true },
  {name: 'Lavée notre appartement', user_id: find_user, description: "Que j'ecries", value: 85, apartment: true }
]

bills.each do |bill|
  Bill.create(bill)
end

# Connecting User to Apartments
p 'Adding users to apartments'
apartments = Apartment.all
users = User.all
apartment_added = []

users.each do |user|
  i = rand(apartments.length)
  user.apartments << apartments[i]
  !apartment_added.include?(i) ? user.user_apartments.first.update(owner: true) : nil
  apartment_added << i
end

# Adding Bills to Users and Apartments
p 'Seeding bills to users and apartments'
bills = Bill.all
bills.each do |bill|
  i = rand(0...users.length)
  user = users[i]
  user.bills << bill
  # user.user_bills.find_by(bill_id: bill.id).update(owner: true)
  if bill.apartment
    user.apartments.first.bills << bill
  else
    i = rand(1..users.length)
    user = User.find_by(id: i)
    user.bills << bill
  end
end

p 'Seeding complete'
