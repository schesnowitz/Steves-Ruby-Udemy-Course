# https://www.tutorialspoint.com/ruby/ruby_operators.htm

=begin
=
Simple assignment operator, assigns values from right side operands to left side operand.
c = a + b will assign the value of a + b into c

+=
Add AND assignment operator, adds right operand to the left operand and assign the result to left operand.
c += a is equivalent to c = c + a

-=
Subtract AND assignment operator, subtracts right operand from the left operand and assign the result to left operand.
c -= a is equivalent to c = c - a

*=
Multiply AND assignment operator, multiplies right operand with the left operand and assign the result to left operand.
c -= a is equivalent to c = c - a

*=
Multiply AND assignment operator, multiplies right operand with the left operand and assign the result to left operand.
c *= a is equivalent to c = c * a

/=
Divide AND assignment operator, divides left operand with the right operand and assign the result to left operand.
c /= a is equivalent to c = c / a

%=
Modulus AND assignment operator, takes modulus using two operands and assign the result to left operand.
c %= a is equivalent to c = c % a

**=
Exponent AND assignment operator, performs exponential (power) calculation on operators and assign value to the left operand.
c **= a is equivalent to c = c ** a
=end

system "cls"
age = 45
# age = age + 55
puts age **= 4


# p age