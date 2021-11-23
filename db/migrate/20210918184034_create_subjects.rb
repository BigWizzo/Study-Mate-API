class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      t.string :title
      t.string :description
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
