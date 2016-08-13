class CommentsController < ApplicationController
  before_action :set_article, except: [:destroy]

  def create
    @comment = @article.comments.build(comment_params)
    if @comment.save
      redirect_to @article, :notice => 'Thanks for your comment'
    else
      redirect_to @article, :alert => 'Unable to add comment'
    end
  end
  
  def destroy
    @article = current_user.articles.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to @article, :notice => 'Comment deleted'
  end
  
  private
    def set_article
      @article = Article.find(params[:article_id])
    end

    def comment_params
      params.require(:comment).permit(:name, :email, :body)
    end
end