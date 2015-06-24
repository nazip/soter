class CreateStorages < ActiveRecord::Migration
  def change
    create_table :storages do |t|
      t.integer :kolvo

      t.timestamps null: false
    end
  end
end
