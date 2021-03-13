require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/json'
require 'sinatra/reloader'

require_relative './models/item.rb'

class App < Sinatra::Base
  set :environment, :development
  set :database_file, "config/database.yml"
  register Sinatra::ActiveRecordExtension
  register Sinatra::Reloader

  get "/" do 
    'Hello, World!'
  end

  post "/item" do
    @item = Item.create(name: params[:name])
    status 201
    json @item
  end

  get '/items' do
    @items = Item.all
    json @items
  end

  get '/items/:id' do
    @item = Item.find(params[:id])
    json @item
  end

end