class RemovePlacementInSquares < ActiveRecord::Migration[5.2]
  def change
        remove_column :squares, :placement
  end
end
