# https://en.wikipedia.org/wiki/Order_of_operations
# Please Excuse My Dear Aunt Sally
# PEMDAS
PEMDAS =
"
P - Parentheses '()'
E - Exponents '**'
M - Multiplication '*'
D - Division '/'
A - Addition '+'
S - Subtraction '-'
"
puts PEMDAS

p 3 + 15 * 23 - 5 / 8**4 + (3 * 2)
# 3 + 15 * 23 - 5 / 8**4 + 6
# 3 + 15 * 23 - 5 / 4096 + 6
# 3 + 345 - 5 / 4096 + 6
# 3 + 345 - 5 / 4096 + 6
# 3 + 345 - 0 + 6
# 348 - 0 + 6
# p (5 * 4096) + (6 - 3)

# Integer (2, 5 , 5675)
# Float (1.2, 1.3 , 6.3)
# Decimal (2.3654121, 5.36542)

p 101.0 / 80.0

