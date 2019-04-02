class CreateAnalytics < ActiveRecord::Migration[5.2]
  def change
    create_table :analytics do |t|
      t.string :user_ip
      t.string :city
      t.string :region
      t.string :country
      t.string :postal_code
      t.references :link
    end
  end
end
