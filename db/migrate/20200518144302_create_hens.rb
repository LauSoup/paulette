class CreateHens < ActiveRecord::Migration[6.0]
  def change
    create_table :hens do |t|
      t.string :breed
      t.string :description
      t.boolean :disponibility
      t.float :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
