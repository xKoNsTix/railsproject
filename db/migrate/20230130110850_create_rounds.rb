class CreateRounds < ActiveRecord::Migration[7.0]
  def change
    create_table :rounds do |t|
      t.references :room, null: false, foreign_key: true
      t.decimal :round_number
      t.boolean :finished
      t.date :creation_date

      t.timestamps
    end
  end
end
