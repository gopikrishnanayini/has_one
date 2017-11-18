class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :number
      t.string :amount
      t.date :date
      t.string :to_address
      t.string :from_address
      t.string :notes

      t.timestamps null: false
    end
  end
end
