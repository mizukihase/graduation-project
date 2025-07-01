module ApplicationHelper
  def default_meta_tags
    {
      site: "おすすめ作品紹介アプリ",
      title: "作品の提案サービス",
      reverse: true,
      charset: "utf-8",
      canonical: request.original_url,
      separator: "|",
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: "website",
        url: request.original_url,
        local: "ja-JP"
      },
      twitter: {
        site: "@iif2Wi5kSY53645"
      }
    }
  end
end
