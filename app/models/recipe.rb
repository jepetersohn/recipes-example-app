class Recipe < ActiveRecord::Base
  validates :title, presence: true
  has_many :taggings
  has_many :tags, through: :taggings

  def tag_names=(tag_string)
    tag_names = tag_string.split(",")
    tags = tag_names.map do |name|
      # normalize the name (strip all the leading and trailing whitespace)
      name = name.strip.downcase
      # if a tag with this name exists, use that
      # otherwise, build a new tag
      tag = Tag.find_by(name: name) || Tag.new(name: name)
    end
    self.tags = tags
  end

  def tag_names
    # pluck the names from the tags association
    # join them with commas
    self.tags.pluck(:name).join(", ")
  end
end
