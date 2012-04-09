class UsersController < ApplicationController
  
  def destroy
		if current_user.try(:admin?)
			@user = User.find(params[:id])
			@user.destroy
	
			respond_to do |format|
				format.html { redirect_to user_list_url, notice: 'User deleted.' }
				format.json { head :ok }
			end
		else
    	redirect_to :permission_error
    end
  end

end