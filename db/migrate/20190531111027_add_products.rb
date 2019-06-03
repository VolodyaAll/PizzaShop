class AddProducts < ActiveRecord::Migration[5.2]
  def change
  	Product.create :title => 'Hawaiian',
  	:description => 'This is hawaiian pizza',
  	:price => 350,
  	:size => 30,
  	:is_spicy => false,
  	:is_veg => false,
  	:is_best_offer => false,
  	:path_to_image => '/images/RU-wp1.jpg'
 
	Product.create :title => 'Pepperoni',
  	:description => 'Nice pepperoni pizza',
  	:price => 450,
  	:size => 30,
  	:is_spicy => false,
  	:is_veg => false,
  	:is_best_offer => true,
  	:path_to_image => '/images/RU-wp2.jpg'

	Product.create :title => 'Vegetarian',
  	:description => 'Amazing vegetarian pizza',
  	:price => 400,
  	:size => 30,
  	:is_spicy => false,
  	:is_veg => false,
  	:is_best_offer => false,
  	:path_to_image => '/images/RU-wp3.jpg'
  end
end
