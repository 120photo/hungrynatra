=begin

Hungrynatra
===========

The homework for this week will be to implement hungry.rb into a sinatra app.

User Stories
============

* As a user I can create a new order.
* As a user I can order an appetizer, entree and dessert.
* As a user I should be presented with a menu and be able to select the item from a dropdown.
* As the restaurant owner, I can view a list of all placed orders

Note: there is no need to implement any kind of authentication/authorization to protect non-owners from viewing the order list (but it would make a great bonus story!)

Bonus
=====

* As an admin, I should be able to edit the items on the menu
* I should be able to pay for my order using [stripe](http://stripe.com)
* [Maybe use this thing?](https://dev.locu.com/)

=end

require 'sinatra'
require 'mongo'

# setup MongoDB Connections
mongo = Mongo::MongoClient.new
db = mongo['hungry']
menu_coll = db['menus']
orders_coll = db['orders']

get '/' do
	@menu = menu_coll.find()
	@items = menu_coll.find()
	erb :home
end

get '/orders' do
	@orders = orders_coll.find()
	erb :orders
end

get '/add' do
	# orders_coll.insert({order: params[:@order]})
	customer_order = []
	customer_order.push(params[:@appetizer_order])
	customer_order.push(params[:@entree_order])
	customer_order.push(params[:@dessert_order])
	customer_order.push(Time.now)
	orders_coll.insert({order: customer_order})
	redirect '/'
end






