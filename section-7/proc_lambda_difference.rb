# Lambda get its name from a type of calculus introduced in the 1930s to help investigate the foundations of mathematics. Lambda calculus helps make computable functions easier to study by simplifying its semantics. The most relevant of these simplifications is that is treats functions ‘anonymously’, meaning that no explicit names are given to functions.

# Generally speaking, in programming the term lambda refers to anonymous functions. These anonymous functions are very common and explicit in some languages (i.e. Javascript) and implicit in others (i.e. Ruby).

# Background Part 2: Where Does the Name Proc Come From

# Proc is short for procedure, which is a set of instructions packaged as a unit to perform a specific task. In different languages these may be called functions, routines, methods, or the generic term callable units. They are usually made to be called multiple times and from multiple times in a program.

# Summary Differences


# - Lambdas check the number of arguments, while procs do not

  lambda_a = lambda { |word_a, word_b| word_a + " " + word_b }
  p lambda_a.call("lambda", "getting called")


  # wrong number of arguments (given 3, expected 2) (ArgumentError)
  # lambda_b = lambda { |word_a, word_b| word_a + " " + word_b }
  # p lambda_b.call("lambda", "ruby", "getting called")

  proc_a = Proc.new { |x, y| x + " " + y }
  p proc_a.call("proc", "2 args", "3 getting called")

  proc_b = Proc.new { |x| x }
  p proc_b.call("this is 'x'", "2 args", "3 getting called")
# - Lambdas and procs treat the ‘return’ keyword differently

def lambda_return
  this_is_a_lambda = lambda { return "This is a lambda string"}
  p this_is_a_lambda.call

  this_is_lambda_2 = lambda { |arg| arg }
  this_is_lambda_2.call("lambda arg getting called")

end

def proc_return
  this_is_a_proc = Proc.new { return }
  this_is_a_proc.call

  this_is_proc_2 = lambda { |arg| arg }
  this_is_proc_2.call("proc arg getting called")

end

p lambda_return
p proc_return