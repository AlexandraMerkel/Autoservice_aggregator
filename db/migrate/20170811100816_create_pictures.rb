class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.references :service, index: true, foreign_key: true, null: false
      t.attachment :image

      t.timestamps null: false
    end
  end
end
