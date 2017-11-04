system 'cls'


stuff = {
  name: "Steve",
  age: 44,
  last_name: "Chesnowitz",
  blah: "something",
  more_blah: "blah",
  blah_number: 456
}

stuff.each do |key, value|
  p key
  p value
end

stuff.each_key do |key|
  p key
end
  
stuff.each_value do |value|
  p value
end
