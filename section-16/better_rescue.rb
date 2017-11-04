system 'cls'

begin
  puts 0 + nil
  # puts 'asdf' / 'asdf'
rescue StandardError => e
  puts "This is an error message of type #{e} #{Time.now}"
end

# puts 0 + nil TypeError
# puts 'asdf' / 'asdf' NoMethodError
# NameError
