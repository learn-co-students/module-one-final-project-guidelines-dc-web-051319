class CreateSquaresTable < ActiveRecord::Migration[5.2]
    def change
        create_table :squares do |t|
            t.integer :placement
            t.integer :restaurant_id
            t.integer :board_id
        end
    end
end
