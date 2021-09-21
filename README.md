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

| Column             | Type      | Options     |
| ------------------ | --------- | ----------- |
| nickname           | string    | null: false |
| email              | string    | null: false |
| encrypted_password | string    | null: false |
| family_name        | string    | null: false |
| first_name         | string    | null: false |
| family_name_kana   | string    | null: false |
| first_name_kana    | string    | null: false |
| birth_day_yy       | integer   | null: false |
| birth_day_mm       | integer   | null: false |
| birth_day_dd       | integer   | null: false |
| phone_number       | integer   | null: false |
| addresses          | references| null: false, foreign_key: true |

### Association

- has_many :items
- has_one  :address

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| price              | integer    | null: false                    |
| item_condition_id  | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| delivery_day_id.   | integer    | null: false                    |
| area_id            | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## address テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | integer    | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| address      | integer    | null: false                    |
| building_name| string     | null: false                    |  
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
