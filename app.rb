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

	orders = orders_input.split(/,/)
	arrres = []

	orders.each do |order|
		
		cnt = order.split(/\=/)[1]
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
	orders_line = params[:orders]
	@orders = parse_order_line orders_line
	erb "#{@orders}"
	# @c = Order.new params[:order]

	# if @c.save
	# 	erb :order
	# else
	# 	@error = @c.errors.full_messages.first
	# 	erb :cart
	# end
end

get '/cart' do	
	@c = Order.new
	erb :cart
end

