class CreateKanrens < ActiveRecord::Migration[7.2]
  def change
    create_table :kanrens do |t|
      t.integer :moto_id
      t.integer :saki_id

      t.timestamps
    end
  end
end
