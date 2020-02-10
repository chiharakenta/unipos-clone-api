class ChangeColumnToNotNull < ActiveRecord::Migration[6.0]
  def up
    change_column_null :users, :google_id, :string, null: false
  end
  def down
    change_column :users, :google_id, :string
  end
end
