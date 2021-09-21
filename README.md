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

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |

### Association

- has_many :items
- has_many :purchased_items

## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| name              | string     | null: false                    |
| category          | string     | null: false                    |
| status            | string     | null: false                    |
| image             | string     | null: false                    |
| explanation       | text       | null: false                    |
| delivery_fee      | string     | null: false                    |
| shipment_location | string     | null: false                    |
| days_to_ship      | string     | null: false                    |
| price             | string     | null: false                    |
| user_id           | references | null: false, foreign_key: true |

### Association

- has_many :purchased_items
- belongs_to :user

## purchased_items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| image        | string     | null: false                    |
| price        | string     | null: false                    |
| delivery_fee | string     | null: false                    |
| seller       | string     | null: false                    |
| buyer        | string     | null: false                    |  
| user_id      | references | null: false, foreign_key: true |

### Association

- has_one :shipping_address

## shipping_address テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| postal_code       | string     | null: false                    |
| prefecture        | string     | null: false                    |
| municipality      | string     | null: false                    |
| address           | string     | null: false                    |
| building_name     | string     | null: false                    |
| telephone_number  | string     | null: false                    |
| purchased_item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :purchased_items