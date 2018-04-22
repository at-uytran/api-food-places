class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :coordinates, :descriptions, :avatar
end
