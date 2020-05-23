ActiveRecord::Base.connection.execute("TRUNCATE users RESTART IDENTITY CASCADE")
puts "==== Create Teacher ===="
Teacher.create([
  { name: 'Administrator', email: 'teacher@example.com', password: '12345678'}
])
puts "==== End ===="

puts "==== Create Student ===="
Student.create([
  { name: 'Student A', email: 'student_a@example.com', password: '12345678'}
])
puts "==== End ===="