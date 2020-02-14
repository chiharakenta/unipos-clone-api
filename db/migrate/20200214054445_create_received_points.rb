class CreateReceivedPoints < ActiveRecord::Migration[6.0]
  def change
    create_table :received_points do |t|
      t.integer :amount, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
