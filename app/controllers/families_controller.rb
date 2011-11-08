class FamiliesController < ApplicationController
  http_basic_authenticate_with :name=> "sarahd", :password => "euucdb", :except => :index

  def index
    @families = Family.order("name ASC")
 
    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @posts }
    end
  end

  def new
    @family = Family.new
 
    respond_to do |format|
      format.html  # new.html.erb
      format.json  { render :json => @post }
    end
  end

  def create
    @family = Family.new(params[:family])
 
    respond_to do |format|
      if @family.save
        format.html  { redirect_to(@family,
                      :notice => 'Family was successfully created.') }
        format.json  { render :json => @family,
                      :status => :created, :location => @family }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @family.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def show
    @family = Family.find(params[:id])
 
    respond_to do |format|
      format.html  # show.html.erb
      format.json  { render :json => @post }
    end
  end

  def edit
    @family = Family.find(params[:id])
  end

  def update
    @family = Family.find(params[:id])
 
    respond_to do |format|
      if @family.update_attributes(params[:family])
        format.html  { redirect_to(@family,
                      :notice => 'Family was successfully updated.') }
        format.json  { render :json => {}, :status => :ok }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @family.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @family = Family.find(params[:id])
    @family.destroy
 
    respond_to do |format|
      format.html { redirect_to families_url }
      format.json { head :ok }
    end
  end

end
