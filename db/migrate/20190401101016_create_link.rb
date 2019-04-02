class CreateLink < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :original_url
      t.string :short_url
      t.string :slug, unique: true
      t.timestamps
    end
  end
end
