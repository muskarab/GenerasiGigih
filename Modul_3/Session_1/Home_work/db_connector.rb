require 'mysql2'
require './item'
require './category'

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

def get_all_categories
	client = create_db_client
	rawData = client.query("SELECT * FROM categories")
	categories = Array.new

	rawData.each do |data|
		category = Category.new(data["id"], data["name"])
		categories.push(category)
	end
	categories
end

def get_items_categories
    client = create_db_client
    rawData = client.query(
        "SELECT items.id, items.name, items.price, categories.id AS category_id, categories.name AS category_name
        FROM items
        JOIN item_categories ON items.id = item_categories.item_id
        JOIN categories ON categories.id = item_categories.category_id
        ORDER BY items.id ASC"
    )
    items = Array.new
    rawData.each do |data|
        category = Category.new(data["id"], data["name"])
        item = Item.new(data["id"], data["name"], data["price"], category)
        items.push(item)
    end
    items
end

def get_item_id(id)
	client = create_db_client
    data = client.query(
        "SELECT items.id, items.name, items.price, categories.id AS category_id, categories.name AS category_name
        FROM items
        JOIN item_categories ON items.id = item_categories.item_id
        JOIN categories ON categories.id = item_categories.category_id
        WHERE items.id = #{id}"
    ).first
    category = Category.new(data["category_id"], data["category_name"])
    item = Item.new(data["id"], data["name"], data["price"], category)
end

def create_new_item(name, price, category_id)
	client = create_db_client
	client.query("INSERT INTO items(name, price) VALUES('#{name}', #{price})")
	client.query("INSERT INTO item_categories(item_id, category_id) VALUES(#{client.last_id}, #{category_id})")
end

def update_item(id, name, price, category_id)
	client = create_db_client
	client.query("UPDATE item_categories SET category_id = #{category_id} WHERE item_id = #{id}")
	client.query("UPDATE items SET name = '#{name}', price = #{price} WHERE id = #{id} ")
end

def delete_item(id)
	client = create_db_client
	client.query("DELETE FROM item_categories WHERE item_id = #{id}")
	client.query("DELETE FROM items WHERE id = #{id}")
end
  
