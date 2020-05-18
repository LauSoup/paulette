class AddNameToHens < ActiveRecord::Migration[6.0]
  def change
    add_column :hens, :name, :string
    add_column :hens, :age, :float
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
