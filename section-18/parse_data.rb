# https://rubygems.org/
# https://github.com/jnunemaker/httparty
# https://udemy-api.herokuapp.com/
system 'cls'
require 'rubygems'
require 'httparty'

class ApiGetter
  include HTTParty
  base_uri 'https://udemy-api.herokuapp.com/'

  def rails_users
    self.class.get('/users.json')
  end
end

data = ApiGetter.new

data.rails_users.each do |user|
  # print "#{user['first_name']} "
  # print "#{user['last_name']} "
  # print "#{user['email']} "
  # print "#{user['street_address']} "
  # print "#{user['id']} "
  raw_time = "#{user['created_at']} "
  parse_time = Time.parse(raw_time)


  first_name = "#{user['first_name']} "
  last_name = "#{user['last_name']} "
  email = "#{user['email']} "
  street_address = "#{user['street_address']} "
  time = parse_time.strftime('%A, %d %b %Y %l:%M %p')

  # text_file = File.new('users.txt', 'a')
  # text_file.puts "First Name: #{first_name}, Last Name: #{last_name}, Email: #{email}, Street Address: #{street_address}"
  # text_file.close

  text_file = File.new('index.html', 'a')
  text_file.puts "<p><ul><li style='color:red;'>First Name: #{first_name}</li> <li>Last Name: #{last_name}</li> <li>Email: #{email}</li> <li>Street Address: #{street_address}</li></ul></p>"
  text_file.close

end

