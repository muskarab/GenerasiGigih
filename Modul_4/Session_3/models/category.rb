require_relative '../db/db_connector'
require_relative './item'

class Category
    attr_reader :id, :name

    def initialize(id, name)
        @id = id
        @name = name
    end

    def Category.get_all_categories
        client = create_db_client
        rawData = client.query("SELECT * FROM categories ORDER BY id ASC")
        categories = Array.new

        rawData.each do |data|
            category = Category.new(data["id"], data["name"])
            categories.push(category)
        end
        categories
    end

    def Category.get_show_category_id(id)
        client = create_db_client
        rawData = client.query("SELECT * FROM categories WHERE id = #{id}")
        categories = Array.new

        rawData.each do |data|
            category = Category.new(data["id"], data["name"])
            categories.push(category)
        end
        categories
    end

    def Category.create_new_category(name)
        client = create_db_client
        client.query("INSERT INTO categories(name) VALUES('#{name}')")
    end

    def Category.get_category_id(id)
        client = create_db_client
        rawData = client.query(
            "SELECT items.id, items.name, items.price, categories.id AS category_id, categories.name AS category_name
            FROM items
            JOIN item_categories ON items.id = item_categories.item_id
            JOIN categories ON categories.id = item_categories.category_id
            WHERE category_id = #{id}
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

    def Category.update_category(id, name)
        client = create_db_client
        client.query("UPDATE categories SET name = '#{name}' where id = #{id}")
    end

    def Category.delete_category(id)
        client = create_db_client
        client.query("DELETE FROM item_categories where category_id = #{id}")
        client.query("DELETE FROM categories where id = #{id}")
    end
end