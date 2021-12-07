class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string  :code,          limit: 10, null: false
      t.string  :name,          limit: 50, null: false
      t.integer :price,                    null: false
      t.timestamps
    end
  end
end
