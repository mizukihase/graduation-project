class CommentsController < ApplicationController
  def create
    @production = Production.find(params[:production_id])
    @comment = @production.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      flash.now[:notice] = "コメントを投稿しました。"
      respond_to do |format|
        format.turbo_stream
      end
    else
      flash.now[:alert] = "コメントの投稿に失敗しました。"
      respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace(
            "new_comment",
            partial: "comments/form",
            locals: { production: @production, comment: @comment }
          ),
          turbo_stream.replace(
            "flash",
            partial: "layouts/flash"
          )
        ]
        end
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
