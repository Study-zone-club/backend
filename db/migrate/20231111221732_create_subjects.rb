class CreateSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :subjects do |t|
      t.string :title
      t.string :area
      t.string :professor
      t.integer :lapse
      t.float :notes, array: true, default: []
      t.float :power, array: true, default: []
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
