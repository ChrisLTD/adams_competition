class AdminController < ApplicationController
	
  def user_list
    if current_user.try(:admin?)
      @users = User.includes(:profile).order("created_at DESC").all
    else
      redirect_to :permission_error
    end
  end

  def file_list
    if current_user.try(:admin?)
      @users = User.includes(:profile).all
    else
      redirect_to :permission_error
    end
  end

  def destroy
		if current_user.try(:admin?)
			@user = User.find(params[:id])
			@user.destroy
	
			respond_to do |format|
				format.html { redirect_to pages_url }
				format.json { head :ok }
			end
		else
    	redirect_to :permission_error
    end
  end
  
#   def destroy
# 		if current_user.try(:admin?)
# 			@user = User.find(params[:id])
# 			@user.destroy
# 	
# 			respond_to do |format|
# 				format.html { redirect_to user_list_url, notice: 'User deleted.' }
# 				format.json { head :ok }
# 			end
# 		else
#     	redirect_to :permission_error
#     end
#   end

end