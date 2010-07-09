class Photo < ActiveRecord::Base
  has_many :taggings
  has_many :tags, :through => :taggings

  def title
    "Photo ##{id}"
  end

  def user
    "BJ Clark"
  end
end
