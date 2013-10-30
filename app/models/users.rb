class Users < ActiveRecord::Base
	require 'bcrypt'
	require 'date'
	require 'securerandom'

	attr_accessible :userId, :login, :firstName, :lastName, :isAdmin, :password, :expDate

	def self.Authenticate(email, pwd)
		user = find_by_login(email)

		if(user != nil)
			checkPwd = BCrypt::Password.new(user.password)

			if(checkPwd == pwd)
				return user.login
			else
				return nil
			end
		end
	end

	def self.ResetPwd(id, email)
		user = find_by(login: email);

		new_pwd = SecureRandom.urlsafe_base64(10, false)
		encryptpwd = BCrypt::Password.create(new_pwd)

		user.update(password: encryptpwd)

		return new_pwd
	end

	def self.AddNewUser(firstname, lastname, email, pwd, confirmPwd)
		if(pwd.to_s == confirmPwd.to_s)
			userguid = SecureRandom.urlsafe_base64(16, false)

			encrypt_pwd = BCrypt::Password.create(pwd);

			self.create(
				:userId			=> userguid,
				:firstName		=> firstname,
				:lastName		=> lastname,
				:login			=> email,
				:password		=> encrypt_pwd,
				:isAdmin		=> false,
				:expDate		=> Time.now.to_date.to_s)

			return true
		else
			return false
		end
	end

	def self.UpdateExpDate(email, extentionType)
		user = find_by(login: email);

		if(extentionType.to_s == "6months")
			renew = 180.days.from_now;
			user.update(:expDate => renew)
		elsif(extentionType.to_s == "12months")
			renew = 365.days.from_now;
			user.update(:expDate => renew)
		end

		Transactions.create(
			:transactionId 	=> SecureRandom.urlsafe_base64(10, false),
			:userId 		=> user.userId,
			:subscription	=> extentionType.to_s)

		return
	end

	def self.DeleteUser(email)
		user = find_by(login: email)
		user.destroy
	end

	def self.UpDateUserInfo(id, newLogin, newPwd)
		user = find_by(userId: id)

		if(user == nil)
			return
		end

		encrypt = BCrypt::Password.create(newPwd)

		user.login = newLogin if (newLogin != nil)
		user.password = encrypt if (newPwd != nil)
		user.save
	end
end
