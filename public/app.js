function something()
{
	var x = window.localStorage.getItem('bbb');

	x = x * 1 + 1;

	window.localStorage.setItem('bbb', x);

	alert(x);
}

function add_to_cart(id)
{	
	var key = 'product_' + id;
	var total = 0;

	var x = window.localStorage.getItem(key);
	x = x * 1 + 1;
	window.localStorage.setItem(key, x);

	for ( var i = 0, len = localStorage.length; i < len; ++i ) {
  		total = total + localStorage.getItem( localStorage.key( i ) )*1;
	}

	alert(total);
}


