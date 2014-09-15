class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.attachment :photo
      t.string :name
      t.decimal :price
      t.string :category

      t.timestamps
    end
  end
end
