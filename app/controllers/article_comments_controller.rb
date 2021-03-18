class ArticleCommentsController < ApplicationController
  
  def create
    @article = Article.find(params[:article_id])
    @comment = current_contributor.article_comment.new(article_comment_params)
    @comment.save
    render :index
  end
    
  def destroy
    @article = Article.find(params[:article_id])
    ArticleComment.find_by(id: params[:id], article_id: params[:article_id]).destroy
    render :index
  end
  
  private

  def article_comment_params
    params.require(:article_comment).permit(:gender, :age, :comment)
  end
  
end
