class RemoveReviewFromVisits < ActiveRecord::Migration[5.2]
    def change
        remove_column :visits, :review
    end
end
