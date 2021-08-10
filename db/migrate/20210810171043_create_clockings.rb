class CreateClockings < ActiveRecord::Migration[6.1]
  def change
    create_table :clockings do |t|
      t.string :topic
      t.string :details
      t.integer :duration

      t.timestamps
    end
  end
end
