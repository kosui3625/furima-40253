class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name,               null: false
      t.integer :price,             null: false
      t.text :comment,              null: false
      t.integer :postage_id,        null: false
      t.integer :item_explain_id,   null: false
      t.integer :prefecture_id,     null: false
      t.references :user,           null: false
      t.integer :category_id,       null: false
      t.integer :take_id,          null: false

      t.timestamps
    end
  end
end
