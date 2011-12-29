class AddPaperToProfile < ActiveRecord::Migration
	def up
		add_column :profiles, :paper, :string
	end
	 
	def down
	  	remove_column :profiles, :paper
	end
end
