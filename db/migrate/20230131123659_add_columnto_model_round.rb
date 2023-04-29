class AddColumntoModelRound < ActiveRecord::Migration[7.0]
  def change
    add_column :rounds, :x_decision, :boolean
    remove_column :rounds, :creation_date
  end
end
