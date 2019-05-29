class CardsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :kind
      t.string :race
      t.text :desc
      t.integer :defense
      t.integer :attack
      t.integer :level
    end
  end
end
