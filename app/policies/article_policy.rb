class ArticlePolicy < ApplicationPolicy
  attr_accessor :user, :article

  def initialize(user, article)
    @user = user
    @article = article
  end

  def create?
    user.editor? || user.author? if user
  end

  def update?
    user.editor? || article.authored_by?(user) if user
  end

  def publish?
    user.editor? if user
  end

  def destroy?
    user.editor? || article.authored_by?(user) if user
  end

  Scope = Struct.new(:user, :scope) do
    def resolve
      if user && user.editor?
        scope.all
      elsif user && user.author?
        scope.where(author_id: user.id) | scope.published
      else
        scope.where(published: true)
      end
    end
  end
end