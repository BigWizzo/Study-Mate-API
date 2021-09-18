class CreateClockings < ActiveRecord::Migration[6.1]
  def change
    create_table :clockings do |t|
      t.string :topic
      t.string :details
      t.integer :duration
      t.references :student, foreign_key: true
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
