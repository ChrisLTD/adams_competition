class AddFieldsToProfiles < ActiveRecord::Migration
  def up
  	change_table :profiles do |t|
			t.remove :name, :institution
			t.text :name, :institution, :address1, :address2, :city, :state, :country
			t.string :zip
		end
  end
  def down
  	change_table :profiles do |t|
			t.remove :address1, :address2, :city, :state, :country, :zip
			t.string :name, :institution
		end
  end
end
