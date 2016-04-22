class CreateAndLinkLikesTable < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.belongs_to :user
      t.belongs_to :item
    end
  end
end
