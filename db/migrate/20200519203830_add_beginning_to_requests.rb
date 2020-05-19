class AddBeginningToRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :beginning, :date
  end
end
