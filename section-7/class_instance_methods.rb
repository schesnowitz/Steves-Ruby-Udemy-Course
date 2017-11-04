class User

  #  this is class method
  def self.all_users
    "All users method"
  end

  # instance metods
  def profile
    "profile method"
  end

  def posts
    "posts method"
  end

  def account
    @account = Account.all
  end
end

# p User.account
user = User.new
p user.account.last
# p user.posts
# p user.profile
