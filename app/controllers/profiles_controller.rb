class ProfilesController < ApplicationController

	# Redirect to users profile edit page
  def redirect
		@profile = Profile.find_by_user_id(current_user.id)
		redirect_to :action => 'edit', :id => @profile.id, :controller => "/profiles"
  end

  # GET /profiles/1/edit
  def edit
  	@profile = Profile.find(params[:id])
  	
  	# Check to see if this user matches the profile, if not don't let them do anything
  	if @profile.id != Profile.find_by_user_id(current_user.id).id and !current_user.try(:admin?)
    	redirect_to :permission_error
    end
    
    @notice = params[:notice]
  end

  # PUT /profiles/1
  # PUT /profiles/1.json
  def update
    @profile = Profile.find(params[:id])
		
		# Check to see if this user matches the profile, if not don't let them do anything
		if @profile.id != Profile.find_by_user_id(current_user.id).id
    	redirect_to :permission_error
    end
		
    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        flash[:notice] = 'Your profile was successfully updated'
        format.html { render action: 'edit', notice: 'Profile was successfully updated' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    if current_user.try(:admin?)
      @profile = Profile.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @profile }
      end
    else
      redirect_to :permission_error
    end
  end

end
