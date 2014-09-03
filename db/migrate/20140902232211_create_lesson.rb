class CreateLesson < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :number
      t.string :name
      t.string :text
      t.timestamps
    end
  end
end
