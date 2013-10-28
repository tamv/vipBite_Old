class Transactions < ActiveRecord::Base
	require 'securerandom'
	require 'active_merchant'

	attr_accessible :transactionId, :userId, :subscription

	def self.billingAddress(params)
		{   
			:name => params[:firstname] + parmas[:lastname],
			:address1 => params[:address],
			:city => params[:city],
			:state => params[:province],
			:country => "CA",
			:zip => params[:postal]
		}
	end

	def self.PurchaseSubscribtion(params)
		creditCard = ActiveMerchant::Billing::CrediCard.new(
			:brand				=> parmas[:cardtype],
			:number				=> params[:cardno],
			:first_name 		=> inputParams[:firstname],
			:last_name 			=> inputParams[:lastname],
			:month 				=> inputParams[:exp_month],
			:year 				=> inputParams[:exp_year],
			:verification_value => inputParams[:cvv])

		billing = billingAddress(params)

		if(creditCrad.valid?)
			response = GATEWAY.purchase(inputParams[:price], creditCard, :ip => inputParams[:ipAddress],
				:billing_address => address)

			return {:complete => response.success?, :message => response.message}
		else
			return nil
		end
	end
end
