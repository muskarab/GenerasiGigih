require_relative '../db/db_connector'
require_relative './category'

class Item
    attr_reader :id, :name, :price, :category

    def initialize(id, name, price, category)
        @id = id
        @name = name
        @price = price
        @category = category
    end

    def valid?
        return false if @id.nil?
        return false if @name.nil?
        return false if @price.nil?
        return false if @category.nil?
        true
    end

    def save
        return false unless valid?
        client = create_db_client
        client.query("INSERT INTO items(name, price) VALUES ('#{name}', #{price})")
        true
    end

    def Item.get_all_items
        client = create_db_client
        rawData = client.query("SELECT * FROM items")
        items = Array.new
    
        rawData.each do |data|
            item = Item.new(data["name"], data["price"], data["id"])
            items.push(item)
        end
        items
    end

    def Item.get_items_categories
        client = create_db_client
        rawData = client.query(
            "SELECT items.id, items.name, items.price, categories.id AS category_id, categories.name AS category_name
            FROM items
            JOIN item_categories ON items.id = item_categories.item_id
            JOIN categories ON categories.id = item_categories.category_id
            ORDER BY items.name ASC"
        )
        items = Array.new
        rawData.each do |data|
            category = Category.new(data["category_id"], data["category_name"])
            item = Item.new(data["id"], data["name"], data["price"], category)
            items.push(item)
        end
        items
    end
    
    def Item.get_item_id(id)
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
    
    def Item.create_new_item(name, price, category_id)
        client = create_db_client
        client.query("INSERT INTO items(name, price) VALUES('#{name}', #{price})")
        client.query("INSERT INTO item_categories(item_id, category_id) VALUES(#{client.last_id}, #{category_id})")
        true
    end
    
    def Item.update_item(id, name, price, category_id)
        client = create_db_client
        client.query("UPDATE item_categories SET category_id = #{category_id} WHERE item_id = #{id}")
        client.query("UPDATE items SET name = '#{name}', price = #{price} WHERE id = #{id} ")
    end
    
    def Item.delete_item(id)
        client = create_db_client
        client.query("DELETE FROM item_categories WHERE item_id = #{id}")
        client.query("DELETE FROM items WHERE id = #{id}")
    end
end