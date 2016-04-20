class AddPostAndUserTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :name
      t.string :password_hash, null: false
      t.string :session_token

      t.timestamps null: false
    end

    create_table :items do |t|
      t.string :title, null: false
      t.string :description
      t.string :image_path
      t.integer :price
      t.string :location, null: false
      t.belongs_to :user, null: false

      t.timestamps null: false
    end
  end
end
