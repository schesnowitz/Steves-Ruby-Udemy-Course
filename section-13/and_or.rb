system 'cls'

# and '&&'

# or '||'

# print "enter your first name: "
# name = gets.chomp.strip
# print "enter your age: "
# age = gets.chomp.to_i
# print "enter chat category: "
# category = gets.chomp.strip

def age_validator

  print "enter your first name: "
  name = gets.chomp.strip
  print "enter your age: "
  age = gets.chomp.to_i
  print "enter chat category: "
  category = gets.chomp.strip


  if age >= 18 && category == 'music' || category == 'movies'
    puts "welcome to the over 18 chat for music and movies #{name}!"
  elsif age >= 18
      puts "welcome to the over 18 chat #{name}!"
  elsif age < 18 && age >= 13
    puts "welcome to the teen chat #{name}!"
  else
    puts "welcome to the kids chat #{name}"
  end
end
age_validator

