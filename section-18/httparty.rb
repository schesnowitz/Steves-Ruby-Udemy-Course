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
puts data.rails_users

