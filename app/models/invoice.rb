class Invoice < ActiveRecord::Base
	validates :amount, :presence => :true
	has_one :payment

  def self.to_csv(options = {})
    CSV.generate do |csv|
      csv << column_names
      all.each do |invoice|
        csv << invoice.attributes.values_at(*column_names)
      end
    end
  end
end
