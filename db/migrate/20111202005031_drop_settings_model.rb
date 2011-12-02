class DropSettingsModel < ActiveRecord::Migration
  def up
  	drop_table :settings
  end

  def down
  	create_table :settings do |t|
      t.string :name
      t.string :text
      t.date :date
      t.boolean :switch
      t.float :value
      t.text :description

      t.timestamps
    end
  end
end
