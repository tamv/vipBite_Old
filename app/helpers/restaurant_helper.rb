module RestaurantHelper

	def getrestaurantSummary(id)
		if (id != nil)
			detailSummary = Details.find_by(detailId: id)
			return detailSummary.promo
		end
	end
end
