class CreateCardsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :type
      t.text :desc
      t.integer :atk
      t.integer :def
      t.integer :level
      t.string :race
      t.string :attribute
      t.string :archetype
    
    end
  end
end
