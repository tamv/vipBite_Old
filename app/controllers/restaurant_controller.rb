class RestaurantController < ApplicationController
	
	def searchRestaurant
		if(request.get?)
			@searchRestaurant = Restaurants.limit(10)
		elsif(request.post?)
			search = "%" << params[:SearchVal] << "%"
			tagsearch = "%" << params[:SearchVal] << "%"

			@searchResult = nil
			searchResult = Restaurants.where('restaurantname ILIKE ? OR tags ILIKE ?', search, tagsearch)

			if(0 != searchResult.count)
				@searchRestaurant = searchResult
			else
				redirect_to(root_url)
			end
		end
	end

	def restaurantDetail
		if(params[:restaurant] != nil)
			result_overview = Restaurants.find_by(restaurantname: params[:restaurant])

			if(result_overview == nil)
				redirect_to('/home/ContactUs') and return
			else
				result_info = Details.find_by(detailId: result_overview.detailId)
			end

			if(result_info == nil)
				redirect_to('/home/ContactUs') and return
			end

			@Name 			= result_overview.restaurantname
			@Deal 			= result_info.promo
			@Detail			= result_info.promoDetail
			@Reservation	= result_info.reservation
			@Phone			= result_overview.phone
			@Hours 			= result_info.detaillink
			@Comment 		= result_info.comment
			@urbanspoonlink = result_info.urbanspoon
			@Tags			= result_overview.tags

			@Latitude		= result_overview.latitude
			@Longitude		= result_overview.longitude

			@Images = []

			Dir.glob("public/Image/restaurant/" << result_info.imgFolder << "/*").each do |file|
				@Images.push("/" << file.split('/')[1..-1].join('/'))
			end
		else
			redirect_to('/home/ContactUs') and return
		end
	end
end
