class RemoveUserConstraintFromItem < ActiveRecord::Migration
  def change
    change_column :items, :user_id, :integer, null: true
  end
end
