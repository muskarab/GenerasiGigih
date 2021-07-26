require_relative '../models/item'
require_relative '../models/category'

class ItemController
    def all_items
        items = Item.get_items_categories
        renderer = ERB.new(File.read("views/index.erb"))
        renderer.result(binding)
    end

    def create_item_form
        categories = Category.get_all_categories
        renderer = ERB.new(File.read('views/create_item.erb'))
        renderer.result(binding)
    end

    def show_item(item_id)
        item = Item.get_item_id(item_id.to_i)
        renderer = ERB.new(File.read('views/show_item.erb'))
        renderer.result(binding)
    end

    def create_item(params)
        item = Item.create_new_item(params['name'], params['price'],params['category_id'])
        all_items
    end

    def delete_item(item_id)
        item = Item.delete_item(item_id.to_i)
        all_items
    end
    
    def update_item_form(item_id)
        item = Item.get_item_id(item_id.to_i)
        categories = Category.get_all_categories
        renderer = ERB.new(File.read('views/update_item.erb'))
        renderer.result(binding)
    end

    def update_item(params)
        item = Item.update_item(params['id'], params['name'], params['price'], params['category_id'])
        all_items
    end
    
end