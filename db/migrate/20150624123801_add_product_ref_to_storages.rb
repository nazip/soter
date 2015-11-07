class AddProductRefToStorages < ActiveRecord::Migration
  def change
    # add_reference :storages, :product, index: true, foreign_key: true
  end
end
