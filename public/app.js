function add_to_cart(id)
{	
	var key = 'product_' + id;	

	var x = window.localStorage.getItem(key);
	x = x * 1 + 1;
	window.localStorage.setItem(key, x);

	update_orders_input();	
}

function cart_get_number_of_items()
{
	var total = 0;

	for ( var i = 0, len =  window.localStorage.length; i < len; ++i ) 
	{
		var key =  window.localStorage.key(i);

		if (key.indexOf('product_') == 0)
		{
			var value =  window.localStorage.getItem(key);	
			total = total + value * 1;
		}
		
	}

	return total;
}

function cart_get_orders()
{
	var orders = "";

	for ( var i = 0, len =  window.localStorage.length; i < len; ++i ) 
	{
		var key =  window.localStorage.key(i);

		if (key.indexOf('product_') == 0)
		{
			var value =  window.localStorage.getItem(key);	
			orders = orders + key + "=" + value + ",";
		}
		
	}

	return orders;
}

function update_orders_input()
{
	var orders = cart_get_orders();
	var number_of_orders = "Cart(" + cart_get_number_of_items() + ")";

	$('#orders_input').val(orders);
	$('#orders_button').val(number_of_orders);
	$('#orders_input_cart').val(orders);


}

function update_cart_orders()
{
	var orders = cart_get_orders();

	$('#products').val(orders);
	
	for ( var i = 0, len =  window.localStorage.length; i < len; ++i ) 
	{
		var key =  window.localStorage.key(i);

		if (key.indexOf('product_') == 0)
		{
			var order = '';
			var value =  window.localStorage.getItem(key);	
			order = key + "=" + value;
			$('#' + key).val(order);
		}
		
	}
}

function order_is_accepted()
{
	alert("Order is accepted");
}

function cancel_order()
{
	window.localStorage.clear();

	update_orders_input();
  	update_cart_orders();
	
	$('#cart').text('Your cart is now empty');

	return false;
}

