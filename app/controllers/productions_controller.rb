class ProductionsController < ApplicationController
  def show
    @production = Production.find(params[:id])
    @comments = @production.comments.includes(:user).order(created_at: :desc)
    @comment = Comment.new
  end
end
