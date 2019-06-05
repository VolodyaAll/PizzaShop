class CreateOrders < ActiveRecord::Migration[5.2]
  def change
  	create_table :orders do |t|
  		t.text :name
  		t.text :phone
  		t.text :adress
  		t.text :order

  		t.timestamps
  	end
  end
end
