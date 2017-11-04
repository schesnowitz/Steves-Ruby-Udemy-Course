system 'cls'

name_list = File.read('files/names.txt')
email_list = File.read('files/emails.txt')
# puts name_list
# puts email_list

name_array = name_list.split
email_array = email_list.split

puts name_array.inspect
puts email_array.inspect

name_array.each do |name|
  puts name.upcase
end

email_array.each do |email|
  puts email.capitalize
end

