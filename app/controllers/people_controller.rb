class PeopleController < ApplicationController
  http_basic_authenticate_with :name => "sarahd", :password => "euucdb", :only => :destroy
  before_filter :find_family
  before_filter :find_person, :only => [:destroy, :edit, :update]

  def new
    @person = @family.people.build
  end

  def create
    @person = @family.people.create(params[:person])
    redirect_to family_path(@family)
  end

  def destroy
    @person.destroy
    redirect_to family_path(@family)
  end

  def edit

  end

  def update
    respond_to do |format|
      if @person.update_attributes(params[:person])
        format.html  { redirect_to(@family,
                      :notice => 'Family was successfully updated.') }
        format.json  { render :json => {}, :status => :ok }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @person.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  private
    def find_person
      @person = @family.people.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      flash[:alert] = "Didn't find the person"
      redirect_to family_path(@family)
    end

  private
    def find_family
      @family = Family.find(params[:family_id])
    end


end
