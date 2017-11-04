system "cls"

# delete
# delete_at
# delete_if

array = [1289, "name", 'hello']
array_num = [1289, 1100, 800, 1400, 500, "Ruby"]
# mod_array_delete = array.delete("hello")
# mod_array_delete_at = array.delete_at(2)
mod_array_delete_if = array_num.delete_if {|less| less == "Ruby"}
# puts array
puts array_num