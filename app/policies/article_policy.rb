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
		@user.editor?
	end

	def update?
	end

	def publish?
		@user.editor?
	end
end
