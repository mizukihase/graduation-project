class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      if resource.persisted?
        if params[:user][:genre_ids].present?
          genre_ids = params[:user][:genre_ids].reject(&:blank?)
          resource.genres = Genre.find(genre_ids)
        end
        RecommendationService.new(resource).generate_recommendations
      end
    end
  end

  def after_sign_up_path_for(resource)
    recommended_works_path
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :age_group, :gender, genre_ids: []).tap do |whitelisted|
      whitelisted[:genre_ids] = whitelisted[:genre_ids].reject(&:blank?) if whitelisted[:genre_ids].present?
    end
  end
end
