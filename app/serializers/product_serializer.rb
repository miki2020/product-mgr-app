class ProductSerializer < ActiveModel::Serializer
  attribute :name
  attributes :description, :price
  has_many :tags

end
