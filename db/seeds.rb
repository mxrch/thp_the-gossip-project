require 'faker'

#DELETE ALL
ActiveRecord::Base.connection.execute("TRUNCATE TABLE gossips RESTART IDENTITY")

10.times do
  gossip = Gossip.create!(author: Faker::Name.first_name, content: Faker::Lorem.sentence)
end
