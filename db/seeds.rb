# Admin
admin = User.new(email: 'admin@email.com', password: 'admin@email.com', admin: true)
admin.save

# User
user = User.new(email: 'user@email.com', password: 'user@email.com')
user.save
