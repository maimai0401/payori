## ※画像投稿機能にはアクティブストレージ使用予定


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
※以下、devise使用予定

### Association
- has_many :posts
- has_many :orders
- has_many :comments


## postsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|text|text|null: false|
|purchase_setting_id|integer|null: false|
|price|integer|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :orders
- has_many :comments


## ordersテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|post|references|null: false, foreign_key: true|

### Association
- belongs_to :post
- belongs_to :user
- has_one :address


## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|postal_code|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|
|tel|string｜null: false|
|order|references|null: false,foreign_key: true|

### Association
- belongs_to :order


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user|references|null: false, foreign_key: true|
|post|references|null: false, foreign_key: true|

### Association
- belongs_to :post
- belongs_to :user