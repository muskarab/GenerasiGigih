require 'mysql2'

def create_db_client
	client = Mysql2::Client.new(
		:host => "localhost",
		:username => "root",
		:password => "",
		:database => ENV["DB_NAME"]
	)
	client
end
  
