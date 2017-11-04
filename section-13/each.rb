system 'cls'

some_array = %w(
  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum
)

hasher = [name: "Ruby", location: "anywhere", code: "Ruby code", clothes: "red"]

# some_array.each do |x|
#   puts x
#   sleep 0.1
# end

hasher.each do |g|
  p "#{g[:name]}"
  p "#{g[:location]}"
  p "#{g[:code]}"
  p "#{g[:clothes]}"
  p g
end