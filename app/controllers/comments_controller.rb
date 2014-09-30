class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy, :update]
  before_action :set_article, only: [:update, :create]

  def create
    @comment = @article.comments.new(comment_params)
    if @comment.save
      flash[:notice] = 'Comment pending approval'
      redirect_to article_path(@article)
    else
      render 'articles/show'
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to article_path(@article), notice: 'Comment approved'
    else
      render 'article/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(
      :author,
      :author_url,
      :author_email,
      :content,
      :approved)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_article
    @article = Article.find(params[:article_id])
  end
end
