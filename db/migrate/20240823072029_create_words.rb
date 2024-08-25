class CreateWords < ActiveRecord::Migration[7.2]
  def change
    create_table :words do |t|
      t.string :kaki
      t.string :yomi
      t.integer :jisuu
      t.string :groove
      t.string :boin
      t.string :hinshi

      t.timestamps
    end
  end
end
