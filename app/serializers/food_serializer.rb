class FoodSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :food_type
  belongs_to :food_category
end
