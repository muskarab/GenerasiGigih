require 'mysql2'
require './item'
require './category'

# client = Mysql2::Client.new(
# 	:host     => 'localhost',
# 	:username => 'root',
# 	:password => '',
# 	:database => 'food_oms_db',
# 	:encoding => 'utf8'
# 	)

# results = client.query("SELECT * FROM items")
# results.each do |row|
# 	puts row
# end

def create_db_client
	client = Mysql2::Client.new(
		:host => "localhost",
		:username => "root",
		:password => "",
		:database => "food_oms_db"
	)
	client
end

def get_all_items
	client = create_db_client
	rawData = client.query("SELECT * FROM items")
	items = Array.new

	rawData.each do |data|
		item = Item.new(data["name"], data["price"], data["id"])
		items.push(item)
	end
	items
end

# items = get_all_items()
# puts "Items"
# puts(items.each)

def get_all_categories
	client = create_db_client
	categories = client.query("SELECT * FROM categories")
end

# categories = get_all_categories()
# puts "Categories"
# puts(categories.each)

def get_all_items_include_categories
	client = create_db_client
	rawData = client.query("SELECT items.id, items.name, items.price, categories.id AS category_id, categories.name AS category_name
	FROM items
	JOIN item_categories ON items.id = item_categories.item_id
	JOIN categories ON item_categories.category_id = categories.id
	ORDER BY items.id ASC
	")
	
	items = Array.new

	rawData.each do |data|
		category = Category.new(data["category_name"], data["category_id"])
		item = Item.new(data["name"], data["price"], data["id"], category)
		items.push(item)
	end
	items
end

# items = get_all_items_include_categories
# items.each do |item|
# 	puts(item.name)
# end

def get_items(price)
	client = create_db_client
	items_below = client.query("SELECT * FROM items where price <= #{price}")
end

# items = get_items(20000)
# puts "Item below"
# puts(items.each)

def create_new_item(name, price)
	client = create_db_client
	create = client.query("INSERT INTO items(name, price) values('#{name}', #{price})")
end
  
