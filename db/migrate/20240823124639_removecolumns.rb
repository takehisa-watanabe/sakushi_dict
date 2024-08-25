class Removecolumns < ActiveRecord::Migration[7.2]
  def change
    remove_column :kanrens, :moto_id
  end
  def change
    remove_column :kanrens, :saki_id
  end
end
