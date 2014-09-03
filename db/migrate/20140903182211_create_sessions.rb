class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :number
      t.string :name
      t.timestamps
    end

    add_column :lessons, :section_id, :integer

  end
end
