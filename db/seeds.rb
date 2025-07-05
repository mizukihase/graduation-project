# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
book_category = Category.find_or_create_by!(name: "本")
manga_category = Category.find_or_create_by!(name: "漫画")
movie_category = Category.find_or_create_by!(name: "映画")

# 本のジャンル
[ "推理小説", "SF", "ファンタジー", "恋愛小説", "歴史" ].each do |genre_name|
  Genre.find_or_create_by!(name: genre_name, category: book_category)
end

# 漫画のジャンル
[ "学園漫画", "SF漫画", "恋愛漫画", "ギャグ", "スポーツ漫画" ].each do |genre_name|
  Genre.find_or_create_by!(name: genre_name, category: manga_category)
end

# 映画のジャンル
[ "アクション", "ロマンス", "コメディ", "ホラー", "SF", "ファンタジー", "アドベンチャー", "アニメーション", "ドキュメンタリー" ].each do |genre_name|
  Genre.find_or_create_by!(name: genre_name, category: movie_category)
end
