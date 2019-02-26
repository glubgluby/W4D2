class CreateCatRentalRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :cat_rental_requests do |t|
      t.integer :cat_id, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      
    end
    add_column :cat_rental_requests, :status, :string, null: false, default: 'PENDING'  
    add_index :cat_rental_requests, :cat_id
  end
end
