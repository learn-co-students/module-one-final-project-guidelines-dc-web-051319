class CreateBoardsTable < ActiveRecord::Migration[5.2]
    def change
        create_table :boards do |t|
            t.string :date
        end
    end
end
