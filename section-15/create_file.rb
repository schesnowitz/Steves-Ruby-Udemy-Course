# r -- read-only (starts at beginning of file)
# r+ -- read and write - update the file
# w -- write-only (if the file exists, overwrites everything in the file)
# w+ -- read and write (if the file exists, overwrites everything in the file)
# a -- append file - add to file
# a+ -- read-write (if file exists, starts at end of file. Otherwise creates a new file). Suitable for updating files.

# file = File.new('files/name.txt', 'a+')
# file.puts('asdf', 'somesadffo', 'asdfy', 'asdfasdfasdfto put here')
# file.close

# create names.txt

names = File.new('files/names.txt', 'w+')
names.puts('Ruby', 'Joe', 'Sally', 'Fred')
names.close

# create emails.txt

emails = File.new('files/emails.txt', 'w+')
emails.puts('ruby@ruby.com', 'joe@example.com', 'sally@sally.io', 'fred@fredville.com')
emails.close

# create read_file.rb

ruby_file = File.new('read_file.rb', 'w+')
ruby_file.puts("system 'cls'")
ruby_file.close

