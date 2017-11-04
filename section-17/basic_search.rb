system 'cls'

stuff_array = %w(
  Buffalo
  Miami
  Steve
  airplane
  tuna
  coffee
  cup
  pen
  123
  7
  99
  hello
)
p stuff_array.grep('Miami')


def show
  @user = User.find(params[:id])
end