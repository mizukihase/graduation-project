class MangasController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    mangas_data = GoogleBooksApi.fetch_books("subject:manga", 20)
    mangas_data.each do |manga_data|
      category = "manga"
      title = manga_data["volumeInfo"]["title"]
      image_url = manga_data["volumeInfo"]["imageLinks"]&.dig("thumbnail")
      # Productionレコードが存在しない場合、新規作成または既存レコードを取得
      production = Production.find_or_initialize_by(external_id: manga_data["id"])

      production.title = manga_data["volumeInfo"]["title"]
      production.author = manga_data["volumeInfo"]["authors"]&.join(", ")
      production.image_url = image_url
      production.category = category
      production.save
    end
    @mangas = Production.where(category: "manga")
  end
end
