class Updatemerchantsidonitems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :merchants_id
    add_column :items, :merchant_id, :integer
  end
end
