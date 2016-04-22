class CreateCommentsTable < ActiveRecord::Migration
  def change
  create_table :comments do |t|
        t.belongs_to :user
        t.belongs_to :item
        t.string :text
      end  
  end
end
