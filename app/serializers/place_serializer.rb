class PlaceSerializer < ActiveModel::Serializer
  attributes :id,
    :name,
    :address,
    :descriptions,
    :location_id,
    :owner_id,
    :open_time,
    :close_time,
    :coordinates,
    :status,
    :place_category_id,
    :total_comments,
    :total_images
  belongs_to :place_category

  def total_comments
    object.comments.size
  end

  def total_images
    object.place_images.size
  end
end
