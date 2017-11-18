class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :amount
      t.date :date
      t.integer :invoice_id
      t.timestamps null: false
    end
  end
end
