require "digest/md5"
password = "password"
hashed_password = Digest::MD5.hexdigest(password)

f=File.open("./user_emails.txt","r")
user=f.read
user=user.split("\n")
f.close

first_initials=("a".."z").to_a
last_names=user

emails = []
1000.times do
  email = first_initials.sample + last_names.sample
  emails.push(email)
end

data = {}
emails.each do |email|
  elemantrary_schools=["CES", "LLS", "SES"]
  random_elemantrary_school=elemantrary_schools.sample
  colors=["Blue", "Green", "Orange", "Yellow"]
  random_color=colors.sample
  days_of_week= ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
  random_day_of_week=days_of_week.sample
  animals=["Cheetahs", "Dogs", "Cats", "Fish"]
  random_animal=animals.sample
  record = {
      "Elemantrary_school"=>random_elemantrary_school,
      "password" => hashed_password,
      "favorite_color"=>random_color,
      "Favorite_Day_Of_The_Week"=>random_day_of_week,
      "Favorite_Animal?"=>random_animal
  }
  data[email]=record
end

require 'json'
the_emails=JSON.generate(data)
puts the_emails
f=File.new("./The_Emails.txt","w")
f.write(the_emails)
