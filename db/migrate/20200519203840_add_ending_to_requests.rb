class AddEndingToRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :ending, :date
  end
end
