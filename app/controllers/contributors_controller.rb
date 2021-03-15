class ContributorsController < ApplicationController
  
  def show
    @contributor = Contributor.find(params[:id])
  end

  def edit
    @contributor = Contributor.find(params[:id])
    if @contributor.id != current_contributor.id
      redirect_to contributor_path(current_contributor.id)
    end
  end
  
  def update
    @contributor = Contributor.find(params[:id])
    if @contributor.update(contributor_params)
      flash[:notice] = "You have updated profile successfully."
      redirect_to contributor_path(@contributor.id)
    else
      render :edit
    end
  end
  
  def contributor_params
    params.require(:contributor).permit(:name, :age, :gender, :introduction, :profile_image)
  end

end
