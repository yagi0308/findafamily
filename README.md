

## アプリケーション名
Find a family

## アプリケーション概要
このオリジナルアプリは、
「迷子・保護動物の情報共有の遅れと、赤ちゃんペットの引き取り手探しの非効率性」を解決したいと思い「ペットの飼い主・引き取り希望者・迷子動物の飼い主・動物ボランティアさん」向けの、「動物の保護・里親探しを円滑にするマッチングプラットフォーム」です。

## URL
https://findafamily.onrender.com

## テスト用アカウント
▪️Basic認証ID：yagi

▪️Basic認証パスワード: 0308

▪️メールアドレス: test@test

▪️パスワード: yagi0308

## 利用方法
動物を保護した時、迷子と思われる動物に出会った時、赤ちゃん動物の譲渡先に迷っている時、ボランティアを募集している時などに画像や詳細を投稿し、ユーザーと連絡を取ることができます。

## アプリケーションを作成した背景
ペットが赤ちゃんを産んだ際、引き取り手を探すのに苦労している様子や、
ペットが脱走し、XやInstagramなどで迷子の情報を発信しているのを、よく目にしていた為、力になれればと思い開発に挑みました。

## 実装機能
▪️ユーザー登録/ログイン/編集/削除機能

【ユーザー登録】
https://gyazo.com/07e2214b216a209e63026d8e5cf42b64

【ログイン】
https://gyazo.com/7e6e1581bbaa072ee416362ce3ca989a

【編集】自己紹介を『よろしくお願いします』から『よろしくお願いします！猫が大好きです！』に編集しました。
https://gyazo.com/d15c9707445c0d92b9fa5ba6b7181d7c

https://gyazo.com/9c8f9460b92b3c98abcdc14d141b414f

【削除】
https://gyazo.com/b0c67a7006050dc3f574c5be28e36e63

▪️投稿機能/編集/削除機能（迷子・保護・赤ちゃん動物・一時預かり・ボランティア募集の情報/動物に関するアイテムの投稿）


【投稿】
https://gyazo.com/79e42dfd87afd69e45ef8b63d3423191

【編集】
https://gyazo.com/1f6c14e3df5a597c9a7f7771ae2c50dc

【削除】
https://gyazo.com/b792e2c470d72a351a0d8ed7b003a703

▪️商品購入機能

https://gyazo.com/a6c4056a1d8b29b090a8613c4a34fdcf

https://gyazo.com/7994b7e72a0a7e5aea013633f26dc1d8

▪️お気に入り機能
https://gyazo.com/a0cb6e64f9edacf9bd91f4cada67ac6a

▪️検索&フィルタ機能

【検索】
https://gyazo.com/8be492723012f4ad09de72bb1fbd8247

【フィルタ】
https://gyazo.com/c43fc13d00da048c965da176fe1d311a

▪️コメント機能
https://gyazo.com/32f85b426b0be76a9a247a1073a7563d

▪️チャット機能
https://gyazo.com/3ec4ccaf8518bddce3ff9582eb630902

※投稿者から見たチャット画面

①チャット一覧
https://gyazo.com/75f74275f87256c59cf86cedb5eb8aa8

②メッセージ投稿
https://gyazo.com/8f270f425476f5c2a1c0bcea2aec4037

③画像投稿
https://gyazo.com/72929270cccc18885692de60bfb9e692

▪️ステータス管理

（譲渡先やボランティアが決まった場合、「見つかりました」にステータス変更可能/商品が売れた場合、「完売しました」にステータス変更可能）

①詳細ページの表示
https://gyazo.com/22045a93046486d00c6b00ebf5bfd0fc

②一覧ページの表示
https://gyazo.com/2c0700ab680337aee9151772c5b358a9


▪️動物ページも商品ページも同じ使用となっています。
商品ページの一覧は下記URLのようになっています。

https://gyazo.com/f1e08df401443c340bd010e9de2f3c54

## データベース設計
[![Image from Gyazo](https://i.gyazo.com/b3403395b60277b29f94617d5eb85f31.png)](https://gyazo.com/b3403395b60277b29f94617d5eb85f31)

## 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/e6981b22d31bec2743d9d315a9408720.png)](https://gyazo.com/e6981b22d31bec2743d9d315a9408720)

## 開発環境
▪️本番アップロード先 （Render）

▪️タスク管理 （GitHub）

▪️テキストエディタ （VS Code）

▪️本番環境データベース（PostgreSQL）

▪️開発環境データベース（MySQL）

▪️プログラミング言語 （JavaScript・Ruby3.2.0・SQL系）

▪️マークアップ・スタイル言語 （HTML・CSS・ERB）

____________________________________

▪️フロントエンド: HTML/CSS/JavaScript

▪️バックエンド: Ruby3.2 / Ruby on Rails 7.1

▪️インフラ （MySQL・Redis）

▪️リアルタイム通信: ActionCable

▪️データベース: 開発環境（MySQL）/デプロイ環境（PostgreSQL）

▪️テスト: RSpec・Rubocop・FactoryBot・Capybara）


## ローカルでの動作方法
% git clone https://findafamily.onrender.com

% cd findafamily

% bundle install

% rails db:create

% rails db:migrate

## 工夫したポイント
▪️動物の情報が詳しくわかるよう、投稿時にできるだけ多くの情報を入力できるように設定しました。

▪️商品投稿機能はおすすめのペット商品が投稿できたら、体験談を発信できて、ユーザーの参考になるかと思い、実装しました。

▪️特に大切なのは投稿者と連絡がスムーズに取れることだと思い、チャット機能を独学で実装しました。

▪️迷子の投稿などはユーザーの気持ちも落ち込んでしまっているかと思い、明るい淡い色をメインに使い実装しました。


## 改善点
▪️1つの投稿に対して画像が何枚も添付できるようにしたかったのですが、経験と勉強不足で上手くいかず断念してしまった為、引き続き勉強し、改良していきたいです。

▪購入した商品が確認できる商品購入記録ページも実装していきたいです。

## 制作時間
約20日間
