ActiveRecord::Base.connection.execute("TRUNCATE tests RESTART IDENTITY CASCADE")
puts "==== Create Test ===="
(1..15).to_a.each do |n|
  Test.create(name: "Test #{n}", description: Faker::Lorem.sentence)
end
puts "==== End ===="

4.times.each do |n|
  question = Question.create(label: "Question #{n}", description: Faker::Lorem.sentence, test: Test.last)
  4.times.each do |n|
    Option.create(answer: "Option #{n}", question: question)
  end
end