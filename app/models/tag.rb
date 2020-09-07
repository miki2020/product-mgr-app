class Tag < ApplicationRecord
  #belongs_to :product
  has_many :taggings
  has_many :products, :through => :taggings
end
