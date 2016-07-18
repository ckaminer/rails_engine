class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.decimal :unit_price
      t.references :merchants, foreign_key: true

      t.timestamps
    end
  end
end
