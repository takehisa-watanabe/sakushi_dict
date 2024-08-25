class Remcolumns < ActiveRecord::Migration[7.2]
  def change
    remove_reference :kanrens, :moto_id
    remove_reference :kanrens, :saki_id
  end
end
