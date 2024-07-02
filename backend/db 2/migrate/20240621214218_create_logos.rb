class CreateLogos < ActiveRecord::Migration[7.1]
  def change
    create_table :logos do |t|
      t.string :image_url, null: false

      t.timestamps
    end
  end
end
