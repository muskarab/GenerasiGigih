require 'sinatra'
# require "sinatra/reloader" if development?
require './db_connector'

get "/" do
    items = get_items_categories
    erb :index, locals: {
        items: items
    }
end

get "/items/new" do
    categories = get_all_categories
    erb :create, locals:{
        categories: categories
    }
end

get "/items/:id/show" do
    id = params['id']
    item = get_item_id(id)
    erb :show, locals:{
        item: item
    }
end

get "/items/:id/edit" do
    id = params['id']
    item = get_item_id(id)
    categories = get_all_categories
    erb :update, locals:{
        item: item,
        categories: categories
    }
end

post "/items/create" do
    name = params['name']
    price = params['price']
    category_id = params['category_id']
    create_new_item(name,price, category_id)
    redirect'/'
end

delete "/items/:id/delete" do
    id = params['id']
    delete_item(id)
    redirect'/'
end

put "/items/:id/update" do
    id = params['id']
    name = params['name']
    price = params['price']
    category_id = params['category_id']
    update_item(id, name, price, category_id)
    redirect'/'
end

