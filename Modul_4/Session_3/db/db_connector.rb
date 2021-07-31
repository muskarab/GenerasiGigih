require 'mysql2'

def create_db_client
	client = Mysql2::Client.new(
		:host => "localhost",
		:username => "muskarab",
		:password => "muskarab",
		:database => "food_oms_db"
	)
	client
end
  
