class CommentPolicy < ApplicationPolicy
  def create?
    @user.author? || @user.editor? if user
  end

  def approve?
    @user.author? || @user.editor? if user
  end

  Scope = Struct.new(:user, :scope) do
    def resolve
      if user && (user.editor? || user.author?)
        scope.all
      else
        scope.where(approved: true)
      end
    end
  end
end
