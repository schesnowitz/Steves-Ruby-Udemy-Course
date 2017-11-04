# https://ruby-doc.org/core-2.2.0/String.html#method-i-sub

string = "I have a new red jacket and it looks great with my red car."

puts string.sub("red", "green")
puts string.gsub("red", "pink")
puts string
# the sub method will find the first instance
# the gsub method will find "global" gsub = global substitutiion