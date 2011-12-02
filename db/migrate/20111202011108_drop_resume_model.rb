class DropResumeModel < ActiveRecord::Migration
  def up
  	drop_table :resumes
  end

  def down
  	create_table "resumes", :force => true do |t|
			t.integer  "user_id"
			t.string   "file"
			t.datetime "created_at"
			t.datetime "updated_at"
  	end
  end
end
