class FoodCategory < ApplicationRecord
  has_many :foods, dependent: :destroy
  belongs_to :parent, class_name: FoodCategory.name, optional: true
end
