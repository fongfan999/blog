class CommentsController < ApplicationController
  before_action :set_article, except: [:destroy]

  def create
    @comment = @article.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @article,
          :notice => 'Thanks for your comment' }
        format.js
      else
        format.html{ redirect_to @article, :alert => 'Unable to add comment' }
        format.js { render "fail_create.js.erb" }
      end
    end
    
  end
  
  def destroy
    @article = current_user.articles.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @article, :notice => 'Comment deleted' }
      format.js
    end
  end
  
  private
    def set_article
      @article = Article.find(params[:article_id])
    end

    def comment_params
      params.require(:comment).permit(:name, :email, :body)
    end
end