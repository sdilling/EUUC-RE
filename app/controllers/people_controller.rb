class PeopleController < ApplicationController
  http_basic_authenticate_with :name => "sarahd", :password => "euucdb", :only => :destroy

  def create
    @family = Family.find(params[:family_id])
    @person = @family.people.create(params[:person])
    redirect_to family_path(@family)
  end

  def destroy
    @family = Family.find(params[:family_id])
    @person = @family.people.find(params[:id])
    @person.destroy
    redirect_to family_path(@family)
  end

end
