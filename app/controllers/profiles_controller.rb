class ProfilesController < ApplicationController

	# Redirect to users profile edit page
	def redirect
		@profile = Profile.find_by_user_id(current_user.id)
		redirect_to :action => 'edit', :id => @profile.id
  end

  # GET /profiles/1/edit
  def edit
  	@profile = Profile.find(params[:id])
  	if @profile.id != Profile.find_by_user_id(current_user.id).id
    	redirect_to :permission_error
    end
  end

  # PUT /profiles/1
  # PUT /profiles/1.json
  def update
    @profile = Profile.find(params[:id])

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

end
