class MigrateUsers < ActiveRecord::Migration
	def up
		create_table :users do |r|
			r.string :userId
			r.string :login
			r.string :firstName
			r.string :lastName
			r.boolean :isAdmin
			r.string :password
			r.datetime :expDate
			r.timestamp
		end
	end
end
