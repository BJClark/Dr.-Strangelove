class Tag < ActiveRecord::Base
  has_many :photos, :through => :taggings
end
