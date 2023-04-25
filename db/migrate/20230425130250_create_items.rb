class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.datetime :_created
      t.string :_data_type
      t.boolean :_is_deleted
      t.datetime :_modified
      t.string :_self_link
      t.string :_user
      t.string :_uuid
      t.string :brand
      t.text :description
      t.string :item_name
      t.integer :quantity_on_hand
      t.integer :sale_price_per_unit
      t.string :sku

      t.timestamps
    end
  end
end
