(1..100).each do |i|
  User.create!(
    name: "user#{i}",
    email: Faker::Internet.email,
    uid: i.to_s
  )
end

(1..5).each do |i|
  Todo.create!(
    name: "todo#{i}",
    user_id: 1
  )
end
