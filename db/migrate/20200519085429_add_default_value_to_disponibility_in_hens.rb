class AddDefaultValueToDisponibilityInHens < ActiveRecord::Migration[6.0]
  def change
    change_column :hens, :disponibility, :boolean, default: true
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
