class MigrateRestaurants < ActiveRecord::Migration
	def change
		create_table :restaurants, restaurantId: :serial do |t|
			t.string :restaurantname
			t.string :address
			t.string :city
			t.string :province
			t.string :postal
			t.string :imageUrl
			t.string :email
			t.string :phone
			t.string :operatinghour
			
			t.float :longitude
			t.float :latitude

			t.string :detailId
			t.string :tags
			t.datetime :modifieddate
			t.timestamps
		end
	end
end
