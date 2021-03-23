class ArticleCommentsController < ApplicationController
  
  def create
    @article = Article.find(params[:article_id])
    @comment = ArticleComment.new(article_comment_params)
    @comment.contributor_id = current_contributor.id
    @comment.article_id = @article.id
    @comment.save
    redirect_to article_path(@article)
  end
    
  def destroy
    @article = Article.find(params[:article_id])
    ArticleComment.find_by(id: params[:id], article_id: params[:article_id]).destroy
    redirect_to article_path(params[:article_id])
  end
  
  private

  def article_comment_params
    params.require(:article_comment).permit(:gender, :age, :comment)
  end
  
  def ensure_correct_contributor
    @article_comment = ArticleComment.find(params[:id])
    unless @article_comment.contributor == current_contributor
      redirect_to articles_path
    end
  end
  
end
