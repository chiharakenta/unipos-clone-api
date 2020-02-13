class AddIntroducedUserIdToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :introduced_user, null: false, foreign_key: { to_table: :users }
  end
end
