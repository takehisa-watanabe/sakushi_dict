class AddCuCategory < ActiveRecord::Migration[7.2]
  def change
    add_column :words, :category, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
