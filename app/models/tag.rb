class Tag < ActiveRecord::Base
  validates :name, uniqueness: true
  has_many :taggings
  has_many :recipes, through: :taggings
end
