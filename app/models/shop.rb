class Shop < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  belongs_to :user

  validates :name, presence: true
  validates :introduction, presence: true
  validates :address, presence: true
  validates :star, presence: true

  acts_as_taggable_on :tags

  def self.ransackable_attributes(auth_object = nil)
    ["address", "created_at", "id", "introduction", "latitude", "longitude", "name", "star", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end
end
