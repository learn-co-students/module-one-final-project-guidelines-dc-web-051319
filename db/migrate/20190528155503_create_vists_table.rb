class CreateVistsTable < ActiveRecord::Migration[5.2]
    def change
        create_table :vists do |t|
            t.integer :user_id
            t.integer :restaurant_id
            t.integer :review
        end
    end
end
