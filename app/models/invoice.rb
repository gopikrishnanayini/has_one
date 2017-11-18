class Invoice < ActiveRecord::Base
	validates :amount, :presence => :true
	has_one :payment
end
