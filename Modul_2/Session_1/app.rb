require 'sinatra'
# require "sinatra/reloader" if development?

items_arr = []

# class HiSinatra < Sinatra::Base
    get '/messages/:name' do
        name = params['name']
        color = params['color'].nil? ? params['color'] : 'Dodgerblue'
        erb :message, locals: {
            color: color,
            name: name
        }
    end

    get '/login' do
        erb :login
    end

    post '/login' do
        if params['username'] == 'admin' && params['password'] == 'admin'
            return 'Logged in ' + params['username']
        else
            redirect '/login'     
        end
    end

    get '/list_form' do
        erb :list_form, locals: {
            items: items_arr
        }
    end

    post '/list_form' do
        items_arr << params['item']
        redirect '/list_form'
    end

#     get '/' do
#         "Hey Sinatra"
#     end

#     get '/hello/:name' do |name|
#         "Hello my name #{name}"
#     end

#     get '/:age' do
#         "Hy I'm #{params[:age]} years old"
#     end

#     get '/say/*/to/*' do
#         # matches /say/hello/to/world
#         params['splat'] # => ["hello", "world"]
#     end

#     get '/download/*.*' do
#         # matches /download/path/to/file.xml
#         params['splat'] # => ["path/to/file", "xml"]
#     end

# end