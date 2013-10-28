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

			if(result_overview.count != 1)
				redirect_to('/home/ContactUs') and return
			else
				result_info = Details.find_by(detailId: result_overview.detailId)
			end

			if(result_info.count != 1)
				redirect_to('/home/ContactUs') and return
			end

			@Name 			= result_overview[0].restaurantname
			@Deal 			= result_info[0].promo
			@Detail			= result_info[0].promoDetail
			@Reservation	= result_info[0].reservation
			@Phone			= result_overview[0].phone
			@Hours 			= result_info[0].detaillink
			@Comment 		= result_info[0].comment
			@urbanspoonlink = result_info[0].urbanspoon

			@Latitude		= result_overview[0].Latitude
			@Longitude		= result_overview[0].Longitude

			@Images = []

			Dir.glob("public/Image/restaurant/" << result_info[0].imgFolder << "/*").each do |file|
				@Images.push(file.split('/')[1..-1].join('/'))
			end
		else
			redirect_to('/home/ContactUs') and return
		end
	end
end
