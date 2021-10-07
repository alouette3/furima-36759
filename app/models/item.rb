class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :delivery_charge
  belongs_to :delivery_day
  belongs_to :item_condition
  belongs_to :prefecture
  
  has_one :purchase_history

  has_one_attached :image

  validates :price, :image, presence: true

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
  end

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_day_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  validates :price, numericality: { with: /\A[0-9]+\z/, message: "は半角数字を使用して下さい" }
  validates :price, numericality: {greater_than: 300,less_than: 9999999}
end
