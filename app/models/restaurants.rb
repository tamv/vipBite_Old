class Restaurants < ActiveRecord::Base
	require 'geocoder'

	attr_accessible :restaurantName, :address, :city, :province, :postal, :imageUrl, :email,
	:phone, :operatinghour, :longitude, :latitude, :detailId, :tags
	
	def self.NewRestaurant(params)
		fullAddress = [params[:address], params[:city], params[:province], params[:postal]].join(",")

		latlong = Geocoder.search(fullAddress)

		newRest = Restaurants.create(
			:restaurantName		=> params[:restaurantName],
			:address			=> params[:address],
			:city				=> params[:city],
			:province 			=> params[:province],
			:postal 			=> params[:postal],
			:imageUrl			=> params[:imgUrl],
			:email				=> params[:email],
			:phone				=> params[:phone],
			:operatinghour		=> parmas[:operatinghour],
			:detailId			=> params[:detailId],
			:tags				=> params[:searchTag],
			:latitude			=> params[:latitude],
			:longitude			=> params[:longitude])
	end
end
