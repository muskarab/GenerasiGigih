require 'sinatra'
# require "sinatra/reloader"
require './controllers/item_controller'
require './controllers/category_controller'

get "/" do
    controller = ItemController.new
    controller.all_items
end
get "/category" do
    controller = CategoryController.new
    controller.all_categories
end

get '/item/create' do
    controller = ItemController.new
    controller.create_item_form
end

post "/item/create" do
    controller = ItemController.new
    controller.create_item(params)
end

get '/category/create' do
    controller = CategoryController.new
    controller.create_category_form
end

post "/category/create" do
    controller = CategoryController.new
    controller.create_category(params)
end

get '/item/show' do
    item_id = params['id']
    controller = ItemController.new
    controller.show_item(item_id)
end

get '/category/show' do
    category_id = params['id']
    controller = CategoryController.new
    controller.show_category(category_id)
end

delete "/item/delete" do
    item_id = params['id']
    controller = ItemController.new
    controller.delete_item(item_id)
end

get '/item/update' do
    item_id = params['id']
    controller = ItemController.new
    controller.update_item_form(item_id)
end

post "/item/update" do
    controller = ItemController.new
    controller.update_item(params)
end

get '/category/update' do
    category_id = params['id']
    controller = CategoryController.new
    controller.update_category_form(category_id)
end

post "/category/update" do
    controller = CategoryController.new
    controller.update_category(params)
end

delete "/category/delete" do
    category_id = params['id']
    controller = CategoryController.new
    controller.delete_category(category_id)
end

