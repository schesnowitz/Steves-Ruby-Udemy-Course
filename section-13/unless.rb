system 'cls'




bacon_array = %w(
  Labore officia incididunt aliquip, deserunt burgdoggen shoulder cupim cillum. Dolore nulla sausage culpa, nostrud swine labore bacon t-bone pig ball tip consequat laborum biltong eu. Sed eiusmod proident corned beef reprehenderit ball tip tri-tip andouille flank cupim biltong nostrud sunt landjaeger enim. In magna esse turkey hamburger ham. Esse filet mignon fugiat ipsum et short loin, spare ribs minim tongue laboris ham hock cupidatat prosciutto quis. Beef ribs in velit, voluptate fugiat bacon ut prosciutto eiusmod enim fatback bresaola labore.
)

PASSWORD = '1234'

def validator
  print "Enter Your Password"
  pass = gets.chomp.strip
  unless PASSWORD != pass
    print "You are logged in"

  else
    print "You are NOT logged in"
  end
end
validator
# if !bacon_array.empty?
#   puts bacon_array
# end



