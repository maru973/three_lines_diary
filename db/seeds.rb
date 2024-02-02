10.times do
  User.create!(
    last_name: Faker::Name.last_name,
    first_name: Faker::Name.first_name,
    email: Faker::Internet.unique.email,
    password: "password",
    password_confirmation: "password"
  )
end

user_ids = User.ids

30.times do |index|
  user = User.find(user_ids.sample)
  user.diaries.create!(first_line: "first_line#{index}", second_line: "second_line#{index}", third_line: "third_line#{index}")
end