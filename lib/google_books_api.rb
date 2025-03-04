module GoogleBooksApi
  BASE_URL = "https://www.googleapis.com/books/v1/volumes"

  def self.fetch_books(query, max_results = 20)
    url = URI("#{BASE_URL}?q=#{URI.encode_www_form_component(query)}&maxResults=#{max_results}&langRestrict=ja")
    response = Net::HTTP.get(url)
    JSON.parse(response)["items"] || []
  end
end
