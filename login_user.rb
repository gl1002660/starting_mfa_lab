require "json"
require "digest/md5"

puts "email?"
email=gets.chomp
puts "password?"
password=gets.chomp
hashed_password=Digest::MD5.hexdigest(password)

f=File.open("./The_Emails.txt","r")
json_string=f.read
data=JSON.parse(json_string)

record=data[email]
if
  record==nil
  puts "invalid email"
  exit
elsif record["password"]!=hashed_password
  puts "invalid password"
  exit
end

numbers=(1..4).to_a.sample
if numbers==1
  puts "what is your favorite color?"
  fav_color=gets.chomp.capitalize
  if fav_color!=record["favorite_color"]
    puts "error invalid login!"
    exit
  end
end

if numbers==2
  puts "whats your favorite day of the week?"
  day_of_week=gets.chomp.capitalize
  if day_of_week!=record["Favorite_Day_Of_The_Week"]
    puts "error invalid login!"
    exit
  end
end

if numbers==3
  puts "whats your favorite animal?"
  fav_animal=gets.chomp.capitalize
  if fav_animal!=record["Favorite_Animal?"]
    puts "error invalid login!"
    exit
  end
end

if numbers==4
  puts "whats your elemantrary school?"
  elemantary_school=gets.chomp.upcase
  if elemantary_school!=record["Favorite_Animal?"]
    puts "error invalid login!"
    exit
  end
end

puts "successful login"