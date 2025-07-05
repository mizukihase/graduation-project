class UserProductionsController < ApplicationController
  def create
    if params[:production_ids]
      params[:production_ids].each do |production_id|
        current_user.user_productions.find_or_create_by(production_id: production_id)
      end
      redirect_to my_list_path, notice: "マイリストに登録しました"
    else
      redirect_back fallback_location: root_path, alert: "作品が選択されていません"
    end
  end

  def destroy
    user_production = current_user.user_productions.find(params[:id])
    user_production.destroy
    redirect_to my_list_path, notice: "マイリストから削除しました"
  end

  def index
    @user_productions = current_user.user_productions.joins(:production).includes(:production)
  end
end
