# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## posts テーブル
| Column             | Type       |  Options           |
|--------------------|----------  |--------------------|
| title	             | string	    |  null: false	      |  タイトル
| animal_image    	 | string		  |  null: false        |  動物の写真（ActiveStorage）
| category           | integer    |  null: false	      |  カテゴリー（迷子・保護・譲渡）
| animal_type	       | string	    |  null: false	      |  動物の種類（犬・猫・鳥など）
| age	               | string	    |	                    |  年齢（例: 3ヶ月、2歳など）
| gender	           | integer    |	                    |  性別（オス・メス・不明）
| personality	       | text		    |  null: false        |  性格（例: 人懐っこい、臆病など）
| description	       | text	      |  null: false	      |  詳細情報
|	address            | string	    |  null: false	      |  保護した場所や譲渡の場所
| user_id	           | references |  foreign_key: true	|  投稿者（Userとの関連）


## users table
| Column             | Type      | Options              |
|--------------------|--------- -|--------------------- |
| first_name	       | string	   | null: false	        | ファーストネーム
| last_name	         | string	   | null: false	        | ラストネーム
| first_name_kana     | string	   | null: false        | ファーストネームカナ
| last_name_kana    | string	   | null: false          | ラストネームカナ
| nickname	         | string	   | null: false	        | ニックネーム（表示名）
| email	             | string	   | null: false, unique	| メールアドレス（ユニーク制約）
| phone_number	     | string	   | null: false,unique	  | 電話番号（ユニーク制約）
| birthdate	         | date		   |                      | 生年月日
| profile_image    	 | string		 |                      | プロフィール画像（ActiveStorage）
| region	           | integer	 | null: false	        | 地域（enum: 都道府県）
| introduction	     | text		   |                      | 自己紹介


## comments table
| Column             | Type        | Options                        |
|--------------------|-------------|------------------------------  |
| user_id	           | references	 | null: false, foreign_key: true	| コメント投稿者（Usersテーブルと関連）
| post_id	           | references	 | null: false, foreign_key: true	| 対象の投稿（Postsテーブルと関連）
| content	           | text        | null: false	                  | コメント本文
| comment_image    	 | string		   |                                | 画像（ActiveStorage）


## follows table
| Column             | Type       | Options                        |
|--------------------|----------- |--------------------------------|
| follower_id        | references | null: false, foreign_key: true |
| followee_id        | references | null: false, foreign_key: true |

## favorites table
| Column             | Type       | Options                            |
|--------------------|----------- |------------------------------------|
| user_id            | references |  null: false, foreign_key: true    |
| post_id            | references |  null: false, foreign_key: true    |

## items（商品情報） table
| Column             | Type      | Options                            |
|--------------------|-----------|------------------------------------|
| name               | string    | null: false                        |
| description        | text      | null: false                        |
| price              | integer   | null: false                        |
| items_category_id  | references| null: false, foreign_key: true     |
| shipping_fee       | integer   | null: false                        |
| shipping_days      | integer   | null: false                        |
| user_id            | references| null: false, foreign_key: true     |

## purchases（購入記録） table
| Column             | Type       | Options                            |
|--------------------|----------- |------------------------------------|
| user_id            | references | null: false, foreign_key: true     |
| item_id            | references | null: false, foreign_key: true     |


## addresses（発送先情報） table
| Column             | Type       | Options                           |
|--------------------|----------- |-----------------------------------|
| postal_code        | string     | null: false                       |
| prefecture_id      | integer    | null: false                       |
| city               | string     | null: false                       |
| street             | string     | null: false                       |
| building           | string     |                                   |
| phone_number       | string     | null: false                       |
| user_id            | references | null: false, foreign_key: true    |
