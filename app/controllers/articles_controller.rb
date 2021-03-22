class ArticlesController < ApplicationController

before_action :ensure_correct_contributor, only: [:create, :update, :edit]

  def new
    @article = Article.new 
  end
  
  def index
    @articles = Article.all
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
    @new_Article = Article.new
    @contributor = Contributor.find(@article.contributor_id)
    @article_comment = ArticleComment.new
  end

  def create
    @article = Article.new(article_params)
    @article.contributor_id = current_contributor.id
    if @article.save
      redirect_to article_path(@article), notice: "You have created article successfully."
    else
      @articles = Article.all
      render 'index'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
     @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article), notice: "You have updated article successfully."
    else
      render "edit"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
  
  private
  
  def article_params
    params.require(:article).permit(:postcode, :prefecture_code, :address_city, :address_street, :title, :body, :image)
  end
  
  def ensure_correct_contributor
    @article = Article.find(params[:id])
    unless @article.contributor == current_contributor
      redirect_to articles_path
    end
  end

end
