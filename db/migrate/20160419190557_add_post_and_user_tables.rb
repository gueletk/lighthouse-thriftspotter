class AddPostAndUserTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :password_hash

      t.timestamps
    end

    create_table :items do |t|
      t.string :title
      t.string :summary
      t.string :image_path
      t.integer :price
      t.string :location

      t.timestamps
    end
  end
end
