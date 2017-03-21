class CreateEnrolls < ActiveRecord::Migration[5.0]
  def change
    create_table :enrolls do |t|
      t.string :course
      t.timestamps
    end
  end
end
