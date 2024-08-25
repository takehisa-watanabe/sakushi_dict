class Addcolumns < ActiveRecord::Migration[7.2]
  def change
    add_reference(:kanrens, :moto, foreign_key:{to_table: :words})
  end
  def change
    add_reference(:kanrens, :saki, foreign_key:{to_table: :words})
  end
end
