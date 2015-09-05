class Recipe < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :chef, class_name: "User"
end
