class Admin::ContributorsController < ApplicationController
  
  before_action :authenticate_admin!

  def index
    @contributors = Contributor.all
  end

  def show
    @contributor = Contributor.find(params[:id])
  end

  def edit
    @contributor = Contributor.find(params[:id])
  end

  def update
    @contributor = Contributor.find(params[:id])
    if @contributor.update(contributor_params)
      redirect_to admin_contributor_path(@contributor)
    else
      render :edit
    end
  end

  private

	def contributor_params
	  params.require(:contributor).permit(:email, :name, :gender, :age, :introduction, :profile_image_id)
	end

end