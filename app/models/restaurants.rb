class Restaurants < ActiveRecord::Base
	require 'geocoder'

	attr_accessible :restaurantname, :address, :city, :province, :postal, :imageUrl, :email,
	:phone, :operatinghour, :longitude, :latitude, :detailId, :tags, :modifieddate
	
	def self.NewRestaurant(params)
		address = params[:address]
		city = params[:city]
		prov = params[:province]
		postal = params[:postal]

		fullAddress = address << "," << city << "," << prov << "," << postal

		latlong = Geocoder.search(fullAddress)

		newRest = Restaurants.create(
			:restaurantname		=> params[:restaurantname],
			:address			=> params[:address],
			:city				=> params[:city],
			:province 			=> params[:province],
			:postal 			=> params[:postal],
			:imageUrl			=> params[:imageUrl],
			:email				=> params[:email],
			:phone				=> params[:phone],
			:operatinghour		=> params[:operatinghour],
			:detailId			=> params[:detailId],
			:tags				=> params[:tags],
			:modifieddate		=> params[:dateInsert],
			:latitude			=> latlong[0].latitude,
			:longitude			=> latlong[0].longitude)
	end
end
