class CommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)

    if @comment.save
      flash[:notice] = "Comment pending approval"
      redirect_to article_path(@article)
    else 
      render 'article/show'
    end
  end

private
  def comment_params
    params.require(:comment).permit(
      :author,
      :author_email,
      :author_url,
      :content)
  end
end

