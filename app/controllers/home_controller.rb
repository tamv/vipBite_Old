class HomeController < ApplicationController
	def Index
	end

	def contactUs
		if(request.post?)
			user = Users.find_by(userId: cookies[:user])

			if(user != nil)
				UserMailer.supportEmail(user, params[:emailContent]).deliver
				redirect_to(root_url) and return
			end
		end
	end

	def aboutUs
	end
end
