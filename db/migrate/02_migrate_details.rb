class MigrateDetails < ActiveRecord::Migration
  def change
  	create_table :details do |t|
  		t.string :detailId
  		t.text :promo
  		t.text :promoDetail
  		t.string :reservation
  		t.string :detaillink
  		t.text :comment
  		t.string :imgFolder
  		t.string :urbanspoon
  		t.timestamp
  	end
  end
end
