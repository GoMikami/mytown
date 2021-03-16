class ArticlesController < ApplicationController

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
    @article_comment = ArticleComment.new
  end

  def create
    @article = Article.new(article_params)
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
    params.require(:article).permit(:postcode, :prefecture_code, :address_city, :address_street, :title, :body, :image_id)
  end

end
