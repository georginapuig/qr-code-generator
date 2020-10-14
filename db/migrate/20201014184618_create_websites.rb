class CreateWebsites < ActiveRecord::Migration[6.0]
  def change
    create_table :websites do |t|
      t.string :url
      t.integer :visits

      t.timestamps
    end
  end
end
