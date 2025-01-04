class AddAreaToLoans < ActiveRecord::Migration[8.0]
  def change
    add_column :loans, :area, :float, null: false, default: 0.0
  end
end
