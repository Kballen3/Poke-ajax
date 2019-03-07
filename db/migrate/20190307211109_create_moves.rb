class CreateMoves < ActiveRecord::Migration[5.2]
  def change
    create_table :moves do |t|
      t.string :name
      t.string :type
      t.belongs_to :pokemon, foreign_key: true

      t.timestamps
    end
  end
end
