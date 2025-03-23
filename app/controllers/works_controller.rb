class WorksController < ApplicationController
  def recommended
    @productions = current_user.productions
    # RecommendationService を使っておすすめ作品を取得
    @recommendations = RecommendationService.new(current_user).generate_recommendations
  end
end
