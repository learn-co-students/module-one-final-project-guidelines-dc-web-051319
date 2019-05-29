class CardsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :type
      t.string :race
      t.text :desc
    end
  end
end
