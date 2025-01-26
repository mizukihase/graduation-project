# graduation-project

## サービス概要
このサービスは、ユーザーが過去に出会ったおすすめの作品（本、映画、漫画）を登録し、他のユーザーがそれを確認できるプラットフォームです。  
自分の好きな作品を共有することで、他のユーザーに新しい作品との出会いを提供します。

## このサービスへの思い・作りたい理由
新しい作品に出会うハードルを下げたい、効率よく面白い作品と出会いたいと考えました。
私は自分の時間効率を気にしてしまうあまり、新しい作品に出会う機会を逃してしまうことが多くありました。
ただ、私と同じ作品が好きな友達から勧められた作品はほとんどの場合、満足のいくものであると気づきました。
そこで、同じ趣味や価値観を持つ他の人々と作品を共有することで、より多くの素晴らしい作品に出会えるのではないかと考えました。

## ユーザー層について
このサービスは、面白い作品に出会いたいと考えているすべての人をターゲットにしています。その理由は、現代の情報過多の時代において、膨大な選択肢の中から自分に合った作品を見つけるのが難しくなっているからです。特に、忙しい日々を送っている人々にとっては、どの作品を選べばいいのか迷うことが多く、本来の目的である「作品を楽しむ時間」が取られてしまうことを避けたいと考えています。
また、友人や知人からの推薦は、選択肢が膨大な中で特に価値がありますが、そのようなネットワークが限られている場合、良い作品に出会うチャンスが少なくなりがちです。このサービスでは、自分と似た趣味を持つ他のユーザーが推薦する作品を簡単に見つけることができ、より多くの面白い作品に出会える機会を提供します。これにより、忙しい中でも効率よく新しい作品に出会うことが可能となります。
そのため、面白い作品を効率よく見つけたい、または新しい作品に触れたいというニーズを持っている人々に特化しているのです。

## サービスの利用イメージ
自分の知っているおすすめの作品を登録する。自分と同じ作品を見たユーザーが自動的におすすめされ、他に見ている作品がわかる。

## ユーザーの獲得について
ツイッターで登録内容をシェア出来るように考えています。

## サービスの差別化ポイント・推しポイント
特定のジャンルに特化したサービスが多いです。複数のジャンルにまたがったサービスもありましたが、日本語の対応がされていません。

以下ChatGPTで調べた同じようなサービスの例5つになります。
### 1. **Goodreads**
   - **概要**: 本を中心とした作品のレビュー、評価、共有ができるプラットフォーム。
   - **特徴**:
     - 自分が読んだ本の記録やレビューを投稿できる。
     - 他のユーザーのレビューやおすすめを見ることができる。
     - 読書リストを作成して管理可能。
   - **対象作品**: 本。

   [Goodreads](https://www.goodreads.com)

---

### 2. **Letterboxd**
   - **概要**: 映画に特化したレビュー、評価、共有プラットフォーム。
   - **特徴**:
     - 自分が観た映画を登録し、感想や評価を投稿できる。
     - 他のユーザーのレビューを閲覧可能。
     - 映画リストを作成して共有できる。
   - **対象作品**: 映画。

   [Letterboxd](https://letterboxd.com)

---

### 3. **MyAnimeList (MAL)**
   - **概要**: アニメや漫画のレビューや評価を共有するためのプラットフォーム。
   - **特徴**:
     - 視聴したアニメや読んだ漫画を記録。
     - 他のユーザーが投稿したレビューやスコアを確認できる。
     - おすすめの作品を発見しやすい仕組みを提供。
   - **対象作品**: アニメ、漫画。

   [MyAnimeList](https://myanimelist.net)

---

### 4. **TasteDive**
   - **概要**: 映画、本、音楽、ゲームなど、多ジャンルの作品をレコメンドするサービス。
   - **特徴**:
     - 気に入った作品を登録すると、それに関連したおすすめ作品を提示。
     - 他のユーザーのおすすめを見ることができる。
   - **対象作品**: 本、映画、音楽、ゲームなど幅広いジャンル。

   [TasteDive](https://tastedive.com)

---

### 5. **Trakt**
   - **概要**: 映画やテレビ番組のトラッキングおよび共有プラットフォーム。
   - **特徴**:
     - 観た作品を記録し、レビューや評価を追加。
     - 他のユーザーの視聴リストや感想を参考にできる。
     - 自分の好みに基づくおすすめ機能も搭載。
   - **対象作品**: 映画、テレビ番組。

   [Trakt](https://trakt.tv)



## 機能候補

### MVPリリース
・ユーザー登録機能
・作品登録機能
・作品おすすめ機能
・フォロー機能
・レビュー・評価投稿
・作品お気に入りリスト
・シェア機能
### 本リリース
・作品一覧機能
・作品検索機能
・ランキング表示
・視聴・読了記録

## 機能の実装方針予定

### MVPリリース
・ユーザー登録機能
 Gemを利用した実装：Authlogic

・作品登録機能
  本:API利用（Google Books APIやNDL Search API）
  映画:API利用（TMDBやOMDB API）

・作品おすすめ機能【1】
 ユーザー登録後、初期のおすすめ作品はランダムにピックアップし、多様な作品を表示し登録を促す
・作品おすすめ機能【2】
ユーザーのプロフィール（年齢、興味ジャンルなど）で登録したデータからおすすめする作品を決める。
  例：興味のジャンル：ミステリー、年齢：20代の場合はこれらの組み合わせでおすすめの作品を表示。

・作品お気に入りリスト
・シェア機能

### 本リリース
・作品一覧機能
・作品検索機能
・ランキング表示
・視聴・読了記録
・フォロー機能
・レビュー・評価投稿
・作品おすすめ機能【3】
おすすめの作品の表示順をソーシャルデータを用いて検索件数が多いものから表示させる
・作品おすすめ機能【4】
  以下のようなアルゴリズムの構築が必要
  ユーザー登録した内容の関係性が高い　→　点数が高い
  作品の評価が高い　→　オススメが多い
  [参考資料](https://qiita.com/pham_thanh_thuong/items/a1404790ca6e967b5c7b)