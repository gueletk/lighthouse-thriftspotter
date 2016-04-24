class AddPlacesColToItems < ActiveRecord::Migration
  def change
    add_column :items, :place_id, :string
  end
end
