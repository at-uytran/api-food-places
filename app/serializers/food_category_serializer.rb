class FoodCategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :parent_id

  has_many :childrens
end
