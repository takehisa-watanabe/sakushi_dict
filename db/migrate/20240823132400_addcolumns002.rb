class Addcolumns002 < ActiveRecord::Migration[7.2]
  def change
    add_column :kanrens, :motono_id, :integer
    add_column :kanrens, :sakino_id, :integer
  end
end
