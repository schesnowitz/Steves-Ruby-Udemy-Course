text = "If the limit parameter is omitted, trailing null fields are suppressed. If limit is a positive number, at most that number of fields will be returned (if limit is 1, the entire string is returned as the only entry in an array). If negative, there is no limit to the number of fields returned, and trailing null fields are not suppressed."

split_var = text.split(//).size

output = "This text box has #{split_var} characters."
puts output
puts text.count("")
