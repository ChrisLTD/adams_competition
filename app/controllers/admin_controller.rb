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

end