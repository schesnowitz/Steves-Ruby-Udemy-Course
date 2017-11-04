=begin
==
Checks if the value of two operands are equal or not, if yes then condition becomes true.

(a == b) is not true.

!=
Checks if the value of two operands are equal or not, if values are not equal then condition becomes true.

(a != b) is true.

>
Checks if the value of left operand is greater than the value of right operand, if yes then condition becomes true.

(a > b) is not true.

<
Checks if the value of left operand is less than the value of right operand, if yes then condition becomes true.

(a < b) is true.

>=
Checks if the value of left operand is greater than or equal to the value of right operand, if yes then condition becomes true.

(a >= b) is not true.

<=
Checks if the value of left operand is less than or equal to the value of right operand, if yes then condition becomes true.

(a <= b) is true.

<=>
Combined comparison operator. Returns 0 if first operand equals second, 1 if first operand is greater than the second and -1 if first operand is less than the second.

(a <=> b) returns -1.

===
Used to test equality within a when clause of a case statement.

(1...10) === 5 returns true.
=end
system "cls"
num_1 = 19 
num_2 = 20
string_1 = "steve"
string_2 = "steve"

puts (string_1 > string_2)
# puts (num_1 == num_2)
# puts (num_1 != num_2) 
# puts (num_1 > num_2)
# puts (num_1 >= num_2)  
# (num_1 < num_2)
# (num_1 <= num_2)
# puts (num_1 <=> num_2)
# puts (1...10) === 5
p (1..10).to_a




