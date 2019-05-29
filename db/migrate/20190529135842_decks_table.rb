class DecksTable < ActiveRecord::Migration[5.0]
  def change
    create_table :decks do |t|
      t.string :name
      t.integer :player_id
    end
  end
end
