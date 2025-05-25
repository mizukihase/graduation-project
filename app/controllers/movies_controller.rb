class MoviesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  require "themoviedb-api"
  Tmdb::Api.key(ENV["TMDB_API"])
  Tmdb::Api.language("ja")
  def index
    movies = Tmdb::Movie.popular.results
    movies.each do |movie|
      external_id = movie.id.to_s
      title = movie.title
      image_url = movie.poster_path ? "https://image.tmdb.org/t/p/w500#{movie.poster_path}" : nil
      category = "movie"
      # Productionレコードを作成または取得
      production = Production.find_or_initialize_by(external_id: external_id)

      detailed_movie = Tmdb::Movie.detail(movie.id, append_to_response: "credits")
      director = detailed_movie["credits"]["crew"].find { |c| c["job"] == "Director" }
      director_name = director ? director["name"] : "不明"
      production.title = title
      production.image_url = image_url
      production.category = category
      production.author = director_name
      production.save
    end
    @q = Production.ransack(params[:q])
    @movies = @q.result(distinct: true).where(category: "movie").page params[:page]
  end
end
