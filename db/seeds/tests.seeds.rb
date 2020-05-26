ActiveRecord::Base.connection.execute("TRUNCATE tests RESTART IDENTITY CASCADE")
puts "==== Create Test ===="
12.times.each do |n|
  test = Test.create(name: "Test-#{n}-#{Faker::Lorem.sentence}", description: Faker::Lorem.sentence)

  4.times.each do |n|
    question = Question.create(label: "Question-#{n}", description: Faker::Lorem.sentence, test: test)
    4.times.each do |n|
      Option.create(answer: "Option-#{n}", question: question)
    end
  end
end
puts "==== End ===="

