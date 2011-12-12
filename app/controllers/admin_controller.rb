class AdminController < ApplicationController
	
	def user_list
		if current_user.try(:admin?)
			@users = User.all
		else
    	redirect_to :permission_error
    end
	end

end