#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db"

class Product < ActiveRecord::Base
end

class Order < ActiveRecord::Base
  validates :name, presence: true
  validates :phone, presence: true
  validates :adress, presence: true
end

def parse_order_line orders_input

  items = orders_input.split(/,/)
  arrres = []

  items.each do |order|
    cnt = order.split(/=/)[1]
    id = order.split(/=/)[0].split(/_/)[1]
    arrtmp = [id, cnt]
    arrres.push arrtmp
  end

  return arrres
end

get '/' do
  @product = Product.order(:id)
  erb :index
end

get '/about' do
  erb :about
end

post '/cart' do
  @orders_input = params[:orders_input]
  @items = parse_order_line @orders_input

  return erb :cart_is_empty if @items.length == 0

  @items.each do |item|
    item[0] = Product.find(item[0])
  end

  @c = Order.new params[:order]

  erb :cart
end

get '/cart' do
  @orders_input = params[:order][orders_input]
  @items = parse_order_line @orders_input

  @items.each do |item|
    item[0] = Product.find(item[0])
  end

  @c = Order.new params[:order]

  erb :cart
end

post '/order' do
  @c = Order.new params[:order]

  if @c.save
    erb :order
  else
    @error = @c.errors.full_messages.first
    erb :cart
  end
end

get '/all_orders' do
  @o = Order.order(id: :desc)
  erb :all_orders
end