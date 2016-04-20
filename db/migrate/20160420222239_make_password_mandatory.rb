class MakePasswordMandatory < ActiveRecord::Migration
  def change
    change_column :items, :user_id, :integer, null: false
  end
end
