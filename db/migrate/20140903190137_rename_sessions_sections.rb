class RenameSessionsSections < ActiveRecord::Migration
  def change
     create_table :sections do |t|
      t.integer :number
      t.string :name
      t.timestamps
    end

    drop_table :sessions

  end
end
