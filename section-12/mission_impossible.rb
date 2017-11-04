system "cls"

PASSWORD = "1234"
@title = "Agent"
def timer_message
  puts "#{@title}-#{@name}, This message will self destruct in 5 seconds..."
  puts "5"
  sleep 1
  puts "4"
  sleep 1
  puts "3"
  sleep 1
  puts "2"
  sleep 1
  puts "1"
  sleep 1
  system 'cls'
end

def mission_impossible

  print "Please enter your name: "
  @name = gets.chomp.strip
  print "#{@name}, Please enter your password provided by agent x: "
  pass = gets.chomp.strip

  if pass == PASSWORD
    puts "The secret code is XCD343$$ -- Good luck #{@name}!"
  else
   timer_message
  end
end
mission_impossible
