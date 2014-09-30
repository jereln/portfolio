class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.editor? || @user.author?
        scope
      else
        scope.where(approved: true)
      end
    end
  end

  def create?
    @user.author? || @user.editor?
  end

  def approve?
    @user.author? || @user.editor?
  end
end