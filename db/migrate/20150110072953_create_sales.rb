class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.references :product, index: true
      t.string :address
      t.string :zipcode
      t.string :country

      t.timestamps
    end
  end
end
