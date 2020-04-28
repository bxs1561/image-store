class CreateStoreImages < ActiveRecord::Migration[6.0]
  def change
    create_table :store_images do |t|
      t.string :first_name
      t.string :last_name
      t.binary :image
      t.datetime :date

      t.timestamps
    end
  end
end
