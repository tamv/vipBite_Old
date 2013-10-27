class AccountController < ApplicationController
	def userAccount
		if(request.post?)
			currentUser = cookies[:user]

			userId = User.find_by(userId: cookies[:user])
			updateEmail = params[:email]
			updatePwd = params[:password]

			Users.UpdateUserInfo(userId, updateEmail, updatePwd)

			redirect_to(root_url)
		elsif(request.get?)
			logginUser = Users.find_by(userId: cookies[:user])

			@loginUserEmail = logginUser.login
			@loginUserExp = logginUser.expDate
		end
	end

	def renewMembership
		currUser = Users.find_by(userId: cookies[:user])

		@FirstName = currUser.firstName
		@LastName = currUser.lastName
		@Email = currUser.login
	end
end
