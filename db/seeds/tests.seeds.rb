ActiveRecord::Base.connection.execute("TRUNCATE tests RESTART IDENTITY CASCADE")
puts "==== Create Test ===="
(1..15).to_a.each do |n|
  Test.create(name: "Test #{n}", description: Faker::Lorem.sentence)
end
puts "==== End ===="