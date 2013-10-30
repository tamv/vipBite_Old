class AccountController < ApplicationController
	def userAccount
		if(request.post?)
			currentUser = cookies[:user]

			user = Users.find_by(userId: cookies[:user])
			updateEmail = params[:email]
			updatePwd = params[:password]

			Users.UpDateUserInfo(user.userId, updateEmail, updatePwd)

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

	def userRegistration
	end

	def userPasswordRecovery
		@recover_user = Users.find_by(login: params[:email])

		if (@recover_user != nil)
			newpwd = Users.ResetPwd(@recover_user.userId, @recover_user.login)

			#send and email to user
			UserMailer.passwordRequest(@recover_user, newpwd).deliver
			redirect_to(root_url)
		end
	end

	def renewExistingSubscription
		if(Users.find_by(login: params[:email]) == nil)
			flash[:warning] = "No User find!" and redirect_to("/account/renew")
		end

		success = Transctions.PurchaseSubscribtion([params[:noc_firstname], params[:noc_lastname], params[:cardno], params[:cardtype], \
			params[:exp_month], params[:exp_year], params[:cvv], 90, request.remote_ip, params[:address], params[:city], \
			params[:prov], params[:postal]])

		if (success != nil && success[:complete] == true)
			Users.UpdateExpDate(params[:email], params[:memberType]) and redirect_to(root_url)
		elsif success.nil?
			flash[:warning] = "FAILURE TO VALIDATE YOUR CREDIT CARD! PLEASE TRY AGAIN" and redirect_to("/account/renew")
		else
			flash[:warning] = success[:message] and redirect_to("/account/renew")
		end
	end

	def newUserScuscription
		if(Users.find_by(login: params[:email])!= nil)
			flash[:warning] = "Email Already Exist"
			redirect_to("/account/Registration") and return
		end

		if(params[:cfm_password].to_s != params[:password].to_s)
			flash[:warning] = "Password do not Match"
			redirect_to("/account/Registration") and return
		end

		if(Users.AddNewUser(params[:firstName], params[:lastName], params[:email], params[:password], params[:cfm_password]))
			if((!params[:noc_lastname].empty?) && (!params[:noc_firstname].empty?) && (!params[:cardno].empty?) \
				&& (!params[:exp_month].empty?) && (!params[:exp_month].empty?) && (!params[:cvv].empty?) \
				&& (!params[:address].empty?) && (!params[:city].empty?) && (!params[:prov].empty?) && (!params[:postal].empty?))

				success = Transactions.PurchaseSubscribtion(
						:firstname				=> params[:noc_firstname],
						:lastname				=> params[:noc_lastname],
						:cardno					=> params[:cardno],
						:cardtype				=> params[:cardtype],
						:cvv					=> params[:cvv],
						:exp_month				=> params[:exp_month],
						:exp_year				=> params[:exp_year],
						:price					=> 90, # this price here will have to change!
						:ipAddress				=> request.remote_ip,
						:address				=> params[:address],
						:city					=> params[:city],
						:province				=> params[:prov],
						:postal					=> params[:postal])

				if (success != nil && success[:complete] == true)
					Users.UpdateExpDate(params[:email], params[:memberType])
					redirect_to(root_url) and return
				elsif success.nil?
					flash[:warning] = "FAILURE TO VALIDATE YOUR CREDIT CARD! PLEASE TRY AGAIN"
					Users.DeleteUser(params[:email]) and return
				else
					flash[:warning] = success[:message]
				end
			else
				Users.DeleteUser(params[:email])
			end
		else
			Users.DeleteUser(params[:email])
		end
	end
end
