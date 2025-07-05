class RecommendationService
  def initialize(user)
    @user = user
  end

  def generate_recommendations
    client = OpenAI::Client.new(access_token: ENV["OPENAI_ACCESS_TOKEN"])

    # ユーザーのジャンルを取得
    genres = @user.genres.map(&:name).join(", ")
    # プロンプト生成
    prompt = <<~PROMPT
      以下のユーザーにおすすめの作品をカテゴリーごとに1件生成してください。
      出力は **作品名のみ** を番号付きで記載し、カテゴリー名は含めないでください。

      年齢層: #{@user.age_group}
      性別: #{@user.gender}
      興味のあるジャンル: #{genres}

      出力形式:
      1. 作品名1
    PROMPT
    mylist_titles = @user.productions.pluck(:title)

    if mylist_titles.any?
      prompt += "マイリストに追加した作品: #{mylist_titles.join('、')}\n"
      Rails.logger.info("作品タイトル一覧: #{mylist_titles.join('、')}")
    else
      Rails.logger.info("ユーザーID: #{@user.id} はマイリストが空です")
    end

    prompt += "\n出力形式:\n1. 作品名1"

    begin
      response = client.chat(
        parameters: {
          model: "gpt-4",
          messages: [ { role: "system", content: prompt } ],
          max_tokens: 500
        }
      )
      # 生成されたレスポンスをパースして保存
      recommendations = response.dig("choices", 0, "message", "content")

      if recommendations.present?
        Rails.logger.info("生成されたおすすめ作品: #{recommendations}")
        generate_and_save_productions(@user, recommendations)
      else
        Rails.logger.warn("おすすめ作品の生成に失敗しました。レスポンス: #{response.inspect}")
      end

    rescue StandardError => e
      Rails.logger.error("OpenAI API Error: #{e.message}")
    end
  end

  def generate_and_save_productions(user, recommendations)
    # 作品名を解析してリストに変換
    works = recommendations.scan(/^\d+\.\s(.+)/).flatten

    works.each do |work|
      # GoogleBooksApi モジュールを使用して作品情報を取得
      begin
        production = GoogleBooksApi.search_and_save_book(work)

        if production.nil?
          Rails.logger.warn("作品情報が取得できませんでした: #{work}")
          next
        end

        Rails.logger.info("保存された作品: #{production.title}")

        # ユーザーとの関連付けを保存
        UserProduction.find_or_create_by(user: user, production: production)
      rescue StandardError => e
        Rails.logger.error("GoogleBooksApi Error for work #{work}: #{e.message}")
      end
    end
  end
end
