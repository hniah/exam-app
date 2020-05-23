class Teacher < User
  devise :database_authenticatable, :validatable, :rememberable
end