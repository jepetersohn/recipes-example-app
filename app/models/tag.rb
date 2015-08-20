class Tag < ActiveRecord::Base
  validates :name, uniqueness: true
  has_many :taggings
  has_many :recipes, through: :taggings

  def to_param
    self.name
  end
end
