class CreateLoans < ActiveRecord::Migration[8.0]
  def change
    create_table :loans do |t|
      t.references :client, null: false, foreign_key: true
      t.string :analysis_id
      t.integer :status, null: false, default: 0
      t.string :culture
      t.boolean :no_till
      t.string :expected_productivity
      t.string :npk_sources

      t.timestamps
    end
  end
end
