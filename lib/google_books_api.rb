require "net/http"
require "json"

module GoogleBooksApi
  BASE_URL = "https://www.googleapis.com/books/v1/volumes"

  def self.fetch_books(query, max_results = 20)
    url = URI("#{BASE_URL}?q=#{URI.encode_www_form_component(query)}&maxResults=#{max_results}&langRestrict=ja")
    response = Net::HTTP.get(url)
    JSON.parse(response)["items"] || []
  end

  def self.search_and_save_book(title)
    books = fetch_books(title)
    Rails.logger.debug "Fetched books: #{books.inspect}"

    return nil if books.empty?

    first_book = books.first
    volume_info = books.first["volumeInfo"]
    Rails.logger.debug "Volume Info: #{volume_info.inspect}"
    # 必要なデータが存在するかチェック
    if volume_info["title"].nil?
      Rails.logger.warn "Missing title for book: #{first_book}"
      return nil
    end
    # 作品情報を Production モデルに保存
    production = Production.find_or_create_by(
      external_id: books.first["id"]
    ) do |p|
      p.title = volume_info["title"]
      p.author = volume_info["authors"]&.join(", ")
      p.category = volume_info["categories"]&.first || "未分類"
      p.image_url = volume_info["imageLinks"]&.dig("thumbnail")
    end
  # 成功した場合にログ出力
  Rails.logger.debug "Successfully found production: #{production.title}"
    production
  end
end
