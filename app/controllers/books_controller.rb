class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    # Google Books APIから書籍データを取得
    books_data = GoogleBooksApi.fetch_books("subject:-manga", 20)

    books_data.each do |book_data|
      category = "other"
      title = book_data["volumeInfo"]["title"]
      image_url = book_data["volumeInfo"]["imageLinks"]&.dig("thumbnail")

      production = Production.find_or_initialize_by(external_id: book_data["id"])
      production.title = book_data["volumeInfo"]["title"]
      production.author = book_data["volumeInfo"]["authors"]&.join(", ")
      production.image_url = image_url
      production.category = category
      production.save
    end
    @books = Production.where(category: "other")
  end
end
