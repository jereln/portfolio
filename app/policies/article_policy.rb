class ArticlePolicy < ApplicationPolicy
  attr_accessor :user, :article

  # class Scope < Struct.new(:user, :scope)
  # 	def resolve
  # 		scope
  # 	end
  # end

  def initialize(user, article)
    @user = user
    @article = article
  end

  def create?
    @user.editor? || @user.author? if @user
  end

  def update?
    @user.editor? || @user.author? if @user
  end

  def publish?
    @user.editor? if @user
  end
end
