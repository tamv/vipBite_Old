class Details < ActiveRecord::Base
	attr_accessible :detailId, :promo, :promoDetail, :reservation, :detaillink,
	:comment, :imgFolder, :urbanspoon

	def self.AddDetail(params)
		remove = Details.find_by(detailId: params[:Id])
		remove.destroy if (remove != nil)

		Details.create(
			:detailId		=> params[:Id],
			:promo			=> params[:promo_Name],
			:promoDetail	=> params[:detail],
			:reservation	=> params[:reservation],
			:detaillink		=> params[:restaurantLink],
			:comment		=> params[:extracomment],
			:imgFolder		=> params[:imagesFolder],
			:urbanspoon		=> params[:urbanspoonlink]
			)
	end
end
