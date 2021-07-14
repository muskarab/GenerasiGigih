require 'mysql2'

client = Mysql2::Client.new(
	:host     => 'localhost',
	:username => 'root',
	:password => '',
	:database => 'ruby',
	:encoding => 'utf8'
	)
results = client.query("SELECT VERSION()")
results.each do |row|
  puts row
end