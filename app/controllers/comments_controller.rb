class CommentsController < ApplicationController
  def create
    @production = Production.find(params[:production_id])
    @comment = @production.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @production, notice: "コメントを投稿しました。" }
      end
    else
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "new_comment",
            partial: "comments/form",
            locals: { production: @production, comment: @comment }
          )
        end
        format.html { redirect_to @production, alert: "コメントの投稿に失敗しました" }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
