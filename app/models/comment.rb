class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :place
  belongs_to :parent, class_name: Comment.name, optional: true
end
