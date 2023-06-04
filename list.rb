require './main'

puts "to list all users press * or press the number of users you need to list"
flag = gets.chomp

if String(flag).eql?("*")
    User.list 
elsif /^[0-9]+$/i.match(String(flag))
    User.list Integer(flag)
else 
    puts "invalid optoin"
end
    



  
