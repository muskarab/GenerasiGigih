require_relative '../models/item'
require_relative '../models/category'

class CategoryController
    def all_categories
        categories = Category.get_all_categories
        renderer = ERB.new(File.read("views/list_category.erb"))
        renderer.result(binding)
    end

    def create_category_form
        renderer = ERB.new(File.read('views/create_category.erb'))
        renderer.result(binding)
    end

    def create_category(params)
        category = Category.create_new_category(params['name'])
        all_categories
    end

    def show_category(category_id)
        items = Category.get_category_id(category_id.to_i)
        renderer = ERB.new(File.read('views/show_category.erb'))
        renderer.result(binding)
    end
    
    def update_category_form(category_id)
        categories = Category.get_show_category_id(category_id.to_i)
        renderer = ERB.new(File.read('views/update_category.erb'))
        renderer.result(binding)
    end

    def update_category(params)
        categories = Category.update_category(params['id'], params['name'])
        all_categories
    end

    def delete_category(category_id)
        categories = Category.delete_category(category_id.to_i)
        all_categories
    end
end