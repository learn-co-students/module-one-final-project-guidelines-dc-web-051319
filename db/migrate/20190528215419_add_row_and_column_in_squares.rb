class AddRowAndColumnInSquares < ActiveRecord::Migration[5.2]
  def change
      add_column :squares, :row, :integer
      add_column :squares, :column, :integer
  end
end
