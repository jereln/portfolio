class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:id])
    @comment = @article.comment.new(comment_params)
    @comment.save
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
end
