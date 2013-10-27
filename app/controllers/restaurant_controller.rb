class RestaurantController < ApplicationController
	def searchRestaurant
		if(request.get?)
			@searchRestaurant = Restaurants.limit(10)
		elsif(request.post?)
			search = "%" << params[:SearchVal] << "%"
			tagsearch = "%" << params[:SearchVal] << "%"

			@searchResult = nil
			searchResult = Restaurants.where("restaurantname LIKE ? OR tags LIKE ?", search, tagsearch)

			if(0 != searchResult.count)
				@searchRestaurant = searchResult
			end
		end
	end
end
