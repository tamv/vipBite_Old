class SessionController < ApplicationController
	def LogIn
		if(params[:email].empty? || params[:password].empty?)
			redirect_to(root_url)
		else
			inEmail = params[:email]
			inPwd = params[:password]

			loginUser = Users.Authenticate(inEmail, inPwd)

			if(loginUser != nil)
				signIn(loginUser)
				redirect_to(root_url) and return
			else
				redirect_to('/register') and return
			end
		end
	end

	def LogOut
		signOut
		redirect_to(root_url) and return
	end
end
