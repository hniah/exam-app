class Student < User
  def generate_token
    self.api_token = Digest::SHA256.hexdigest([Time.now.to_i, email].join)
    self.save
    self.api_token
  end
end