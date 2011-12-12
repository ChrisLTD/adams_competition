class PagesController < ApplicationController
  # GET /pages
  # GET /pages.json
  def index
  	if current_user.try(:admin?)
			@pages = Page.all
	
			respond_to do |format|
				format.html # index.html.erb
				format.json { render json: @pages }
			end
    else
    	redirect_to :permission_error
    end
  end
  
  # GET /pages/1
  # GET /pages/1.json
  def show
    @page = Page.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page }
    end
  end
  
  def show_slug
    @page = Page.find_by_slug(params[:slug])
		
    if @page 
			respond_to do |format|
				format.html # show.html.erb
				format.json { render json: @page }
			end
		else
			respond_to do |format|
				format.html { render :file => "#{Rails.root}/public/404.html", :status => :not_found }
			end
		end
  end

  # GET /pages/new
  # GET /pages/new.json
  def new
  	if current_user.try(:admin?)
			@page = Page.new
	
			respond_to do |format|
				format.html # new.html.erb
				format.json { render json: @page }
			end
		else
    	redirect_to :permission_error
    end
  end

  # GET /pages/1/edit
  def edit
  	if current_user.try(:admin?)
   		@page = Page.find(params[:id])
		else
    	redirect_to :permission_error
    end
  end

  # POST /pages
  # POST /pages.json
  def create
  	if current_user.try(:admin?)
			@page = Page.new(params[:page])
	
			respond_to do |format|
				if @page.save
					format.html { redirect_to @page, notice: 'Page was successfully created.' }
					format.json { render json: @page, status: :created, location: @page }
				else
					format.html { render action: "new" }
					format.json { render json: @page.errors, status: :unprocessable_entity }
				end
			end
		else
    	redirect_to :permission_error
    end
  end

  # PUT /pages/1
  # PUT /pages/1.json
  def update
		if current_user.try(:admin?)
			@page = Page.find(params[:id])
	
			respond_to do |format|
				if @page.update_attributes(params[:page])
					format.html { redirect_to @page, notice: 'Page was successfully updated.' }
					format.json { head :ok }
				else
					format.html { render action: "edit" }
					format.json { render json: @page.errors, status: :unprocessable_entity }
				end
			end
		else
    	redirect_to :permission_error
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
		if current_user.try(:admin?)
			@page = Page.find(params[:id])
			@page.destroy
	
			respond_to do |format|
				format.html { redirect_to pages_url }
				format.json { head :ok }
			end
		else
    	redirect_to :permission_error
    end
  end
end
