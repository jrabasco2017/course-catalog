class CreateInstructors < ActiveRecord::Migration[5.0]
  def change
    create_table :instructors do |t|
      t.string :first
      t.string :last
      t.string :ident
      t.timestamps
    end
  end
end
