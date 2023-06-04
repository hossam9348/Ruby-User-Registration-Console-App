require './main'

puts "please etner your name"
name = gets.chomp

puts "please etner your email"
email = gets.chomp

puts "please etner your mobile"
mobile = gets.chomp

$user = User.new name, email, mobile
$user.create