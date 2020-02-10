class ChangeColumnToNotNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users, :google_id, null: false
  end
end
