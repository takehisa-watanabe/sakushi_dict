class Droptable < ActiveRecord::Migration[7.2]
  def change
    drop_table :kanrens
  end
end
