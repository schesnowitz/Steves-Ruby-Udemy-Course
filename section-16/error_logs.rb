system 'cls'

def error_logs(exception) 
  File.open('logs/error_logs.txt', 'a') do |file|
    file.puts exception
  end
end


begin
  '10 + nil' / 'asdf'
rescue StandardError => exception
  error_logs("There was an error -> #{exception} at #{Time.now}")
end