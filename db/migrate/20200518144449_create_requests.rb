class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.integer :duration
      t.references :user, null: false, foreign_key: true
      t.references :hen, null: false, foreign_key: true

      t.timestamps
    end
  end
end
