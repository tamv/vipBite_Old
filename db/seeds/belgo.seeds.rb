
Restaurants.NewRestaurant(
		:restaurantname		=> 'belgo',
		:address			=> '501 - 8th Avenue SW',
		:city				=> 'Calgary',
		:province			=> 'Alberta',
		:postal				=> 'T2P1G1',
		:imageUrl			=> 'belgo.jpg',
		:email				=> 'shaun@belgo.ca',
		:phone				=> '403.265.6555',
		:operatinghour		=> '9-5',
		:detailId			=> 'belgo_promo',
		:tags				=> '#fusion, #dinner',
		:dateInsert			=> "2010-08-01"
	)

Details.AddDetail(
		:Id					=> 'belgo_promo',
		:promo_Name			=> 'Promotion Name',
		:detail				=> 'Promotion Detail',
		:reservation		=> 'http://www.belgo.ca/webpage/1003100/1000485',
		:restaurantLink		=> 'http://www.belgo.ca/page/reservations/1000485',
		:extracomment		=> 'extra suggestion place here',
		:imagesFolder		=> 'belgoimgs',
		:urbanspoonlink		=> 'urbanspoon.com'
	)