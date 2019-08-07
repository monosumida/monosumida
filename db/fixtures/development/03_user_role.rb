3.times do |i|
  UserRole.seed do |ur|
    ur.id = i+1
    ur.user_id = i+1
    ur.role_id = i+1
  end
end
