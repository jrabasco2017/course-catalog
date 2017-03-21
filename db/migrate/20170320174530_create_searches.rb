class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.string :key
      t.string :linked
      t.timestamps
    end
  end
end
