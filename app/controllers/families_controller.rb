class FamiliesController < ApplicationController
  http_basic_authenticate_with :name=> "sarahd", :password => "euucdb", :except => :index
  before_filter :find_family, :only => [:show,
                                        :edit,
                                        :update,
                                        :destroy]
  def index
    @families = Family.order("name ASC")
    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @families }
    end
  end

  def new
    @family = Family.new
    respond_to do |format|
      format.html  # new.html.erb
      format.json  { render :json => @family }
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
    respond_to do |format|
      format.html  # show.html.erb
      format.json  { render :json => @family }
    end
  end

  def edit

  end

  def update
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
    @family.destroy
    respond_to do |format|
      format.html { redirect_to families_url }
      format.json { head :ok }
    end
  end

  private
    def find_family
      @family = Family.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      flash[:alert] = "That family isn't found."
      redirect_to families_path
    end
end
