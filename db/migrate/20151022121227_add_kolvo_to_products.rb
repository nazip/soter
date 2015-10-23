class AddKolvoToProducts < ActiveRecord::Migration
  def change
    add_column :products, :kolvo, :integer
  end
end
