class Shop < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  belongs_to :user

  validates :name, presence: true
  validates :introduction, presence: true
  validates :address, presence: true
  validates :star, presence: true
end
