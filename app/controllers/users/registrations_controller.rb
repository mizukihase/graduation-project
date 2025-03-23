class RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      if resource.persisted?
        if params[:user][:genre_ids].present?
          genre_ids = params[:user][:genre_ids]
          resource.genres = Genre.find(genre_ids)
        end
        generate_recommendations(resource)
      end
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :age_group, :gender, genre_ids: []).tap do |whitelisted|
      whitelisted[:genre_ids] = whitelisted[:genre_ids].reject(&:blank?) if whitelisted[:genre_ids].present?
    end
  end
end
