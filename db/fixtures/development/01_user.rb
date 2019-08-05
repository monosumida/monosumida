require 'fileutils'

file_path = Rails.root.join('db/fixtures/development/files')

User.seed do |u|
  u.id = 1
  u.name = 'admin'
  u.email = 'admin@monosumida.com'
  u.description = 'I am the administrator of this site.'
  u.password = 'password'
  u.image = file_path.join('images', 'admin.png').open
end

User.seed do |u|
  u.id = 2
  u.name = 'general_0'
  u.email = 'general_0@monosumida.com'
  u.description = 'I am the general user of this site.'
  u.password = 'password'
  u.image = file_path.join('images', 'general.png').open
end
