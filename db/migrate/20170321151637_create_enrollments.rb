class CreateEnrollments < ActiveRecord::Migration[5.0]
  def change
    create_table :enrollments do |t|
      t.string :course
      t.integer :user_id

      t.timestamps
    end
    add_index :enrollments, [:course, :user_id]
  end
end
