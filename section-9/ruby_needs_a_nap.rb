def name_app
  print "Enter your first name: "
  
  first_name = gets.chomp.strip
  
  if first_name == "" 
    puts "You need to enter a valid name..."
    puts "Rebooting Application - Please Wait."
    sleep 1
    puts "Please Wait..."
    sleep 1.3
    puts "One Moment..."
    sleep 1.8
    puts "Still Working..."
    sleep 2
    puts "Almost Done..."
    sleep 1
    name_app
  else
    first_name_count = first_name.size
    first_character = first_name.split(//)[0]
    first_character_cap = first_character.upcase
    first_name_sub = first_name.sub(first_character, first_character_cap)

    puts "Welcome to the console #{first_name_sub} your name contains #{first_name_count} characters"
  end
end
name_app