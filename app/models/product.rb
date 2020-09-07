class Product < ApplicationRecord
  #validates :name, presence: true
  #has_many :taggable
  #has_many :tags
  has_many :taggings
  has_many :tags, :through => :taggings
#accepts_nested_attributes_for :tags,    :allow_destroy => true,    :reject_if     => :all_blank
end
