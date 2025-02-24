

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
| Column             | Type       |  Options            |
|--------------------|----------  |-------------------- |
| title	             | string	    |  null: false	      |
| animal_image    	 | string		  |  null: false        |
| category_id        | integer    |  null: false	      |
| animal_type	       | string	    |  null: false	      |
| age	               | string	    |	                    |
| gender_id	         | integer    |	                    |
| personality	       | text		    |  null: false        |
| description	       | text	      |  null: false	      |
|	address            | string	    |  null: false	      |
| user_id	           | references |  foreign_key: true	|


## users table
| Column             | Type      | Options              |
|--------------------|--------- -|--------------------- |
| first_name	       | string	   | null: false	        |
| last_name	         | string	   | null: false	        |
| first_name_kana    | string	   | null: false          |
| last_name_kana     | string	   | null: false          |
| nickname	         | string	   | null: false	        |
| email	             | string	   | null: false, unique	|
| phone_number	     | string	   | null: false,unique	  |
| birthdate	         | date		   |                      |
| profile_image    	 | string		 |                      |
| region	           | integer	 | null: false	        |
| introduction	     | text		   |                      |


## comments table
| Column             | Type        | Options                        |
|--------------------|-------------|------------------------------  |
| user_id	           | references	 | null: false, foreign_key: true	|
| post_id	           | references	 | null: false, foreign_key: true	|
| content	           | text        | null: false	                  |
| comment_image    	 | string		   |                                |


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
| item_id            | references |  null: false, foreign_key: true    |

## items table
| Column             | Type      | Options                            |
|--------------------|-----------|------------------------------------|
| name               | string    | null: false                        |
| description        | text      | null: false                        |
| price              | integer   | null: false                        |
| category_id        | integer   | null: false, foreign_key: true     |
| shipping_fee_id    | integer   | null: false                        |
| shipping_days_id   | integer   | null: false                        |
| items_image        | string    | null: false                        |
| user_id            | references| null: false, foreign_key: true     |


## purchases table
| Column             | Type       | Options                            |
|--------------------|----------- |------------------------------------|
| user_id            | references | null: false, foreign_key: true     |
| item_id            | references | null: false, foreign_key: true     |


## addresses table
| Column                 | Type       | Options                           |
|--------------------    |----------- |-----------------------------------|
| postal_code            | string     | null: false                       |
| prefecture_id          | integer    | null: false                       |
| city                   | string     | null: false                       |
| street                 | string     | null: false                       |
| building               | string     |                                   |
| home_phone_number      | string     | null: false                       |
| purchase_id            | references | null: false, foreign_key: true    |


## rooms テーブル
| Column             | Type       | Options                            |
| ------------------ | ------     | ---------------------------------  |
| user_id            | references | null: false, foreign_key: true     |
| post_id            | references |  null: false, foreign_key: true    |
| message_image      | string     |                                    |


## entries テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

## messages テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| message | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |
