## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string｜null: false|

### Association
- has_many :posts
- has_many :orders
- has_many :comments


## Postsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string｜null: false|
|text|text｜null: false|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :order
- has_many :comments


## Ordersテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

### Association
- belongs_to :post
- belongs_to :user
- has_one :address
- has_one :card


## Addressesテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string｜null: false|
|last_name|string｜null: false|
|first_name_kana|string｜null: false|
|last_name_kana|string｜null: false|
|postal_code|string｜null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|
|tel|string｜null: false|
|order|references|null: false,foreign_key: true|

### Association
- belongs_to :order


## Cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_token|string|null: false|
|customer_token|string|null: false|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :order


## Commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text｜null: false|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

### Association
- belongs_to :post
- belongs_to :user