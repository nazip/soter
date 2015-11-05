class AddArtToProducts < ActiveRecord::Migration
  def change
    add_column :products, :art, :string
  end
end
