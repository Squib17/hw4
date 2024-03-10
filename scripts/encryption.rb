#Encrypt the password and puts the encrypted string
secret = "puppies"
result = BCrypt::Password.create(secret)
puts result

#Testing the encrypted string
puts BCrypt::Password.create(result) == secret

#Test password against the encrypted string
