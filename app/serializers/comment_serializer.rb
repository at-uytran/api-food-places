class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content
  has_many :childrens
end
