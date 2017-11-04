# https://ruby-doc.org/core-2.2.0/Proc.html

# Proc objects are blocks of code that have been bound to a set of local variables. Once bound, the code may be called in different contexts and still access those variables.

# can be written like this 
# the { braces } create a 'do' block
artist = Proc.new { |name, guitar| name + " " + guitar } 

# can be written like this
artist_b = Proc.new do |name, guitar| 
  name + " " + guitar * 3 
end
 
artist_c = Proc.new do |name, guitar| 
  name.upcase + " " + guitar.upcase 
end

artist_d = Proc.new { |name, guitar| name.upcase + " " + guitar.upcase }

# can be called 
p artist["Eric Clapton", "Stratocaster"]

# can be called
p artist.call("Eric Clapton", "Stratocaster")  

# artist_b can be called like this
p artist_b["Mark Knopfler", "Stratocaster / Pensa Suhr"] 

# or you can call it using the call method
p artist_b.call("Mark Knopfler", "Stratocaster / Pensa Suhr")

p artist_c["Eddie Van Halen", "Frankenstrat"] 
p artist_c.call("Eddie Van Halen", "Frankenstrat")

p artist_d["Jimi Hendrix", "Strat"] 
p artist_d.call("Jimi Hendrix", "Strat")