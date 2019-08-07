file_path = Rails.root.join('db/fixtures/development/files')

3.times do |i|
  User.seed do |u|
    u.id = i+1
    u.name = "admin_#{i+1}"
    u.email = "admin_#{i+1}@monosumida.com"
    u.description = 'I am the administrator of this site.'
    u.image = file_path.join('images', 'admin.png').open
  end
  user = User.find(i+1)
  user.password = 'password'
  user.password_confirmation = 'password'
end

3.times do |i|
  User.seed do |u|
    u.id = i+11
    u.name = "general_#{i+11}"
    u.email = "general_#{i+11}@monosumida.com"
    u.description = 'I am the general user of this site.'
    u.image = file_path.join('images', 'general.png').open
  end
  user = User.find(i+11)
  user.password = 'password'
  user.password_confirmation = 'password'
end
