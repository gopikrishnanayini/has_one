class Payment < ActiveRecord::Base
	validates :amount, :presence => :true
	belongs_to :invoice
end
