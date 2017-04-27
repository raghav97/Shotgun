class CreatePurelations < ActiveRecord::Migration[5.0]
  def change
    create_table :purelations do |t|
      t.integer     :product_id
      t.integer     :user_id
      t.timestamps null: false
    end
  end
end
