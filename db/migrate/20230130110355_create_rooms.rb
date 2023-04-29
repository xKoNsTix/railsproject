class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.decimal :prizepool
      t.boolean :finished
      t.boolean :active
      t.string :x_color
      t.string :o_color

      t.timestamps
    end
  end
end
