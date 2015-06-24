class RemoveKolvoFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :kolvo, :integer
  end
end
