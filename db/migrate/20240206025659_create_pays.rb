class CreatePays < ActiveRecord::Migration[7.0]
  def change
    create_table :pays do |t|
      t.references :item,             null: false, foreign_key: true
      t.references :user,             null: false, foreign_key: true

      t.timestamps
    end
  end
end
