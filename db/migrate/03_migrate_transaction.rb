class MigrateTransaction < ActiveRecord::Migration
  def change
  	create_table :transactions do |t|
  		t.string :transactionId
  		t.string :userId
  		t.string :subscription
  		t.timestamps
  	end
  end
end
