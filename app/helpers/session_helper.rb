module SessionHelper
	def current_user=(user)
		@current_user = user
	end

	def signIn(user)
		loginUser = Users.find_by(login: user)

		cookies[:user] = {:value => loginUser.userId, :expires => Time.now + 3600}

		self.current_user = loginUser
	end

	def checkUserCookies
		if(cookies[:user] != nil)

			retrieveUser = Users.find_by(userId: cookies[:user])

			if(retrieveUser != nil)
				@current_user = retrieveUser

				return true
			else
				return false
			end
		else
			return false
		end
	end

	def signOut
		self.current_user = nil
		cookies.delete(:user)
	end
end
