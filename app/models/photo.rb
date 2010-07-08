class Photo < ActiveRecord::Base
  has_many :tags, :through => :taggings
end
