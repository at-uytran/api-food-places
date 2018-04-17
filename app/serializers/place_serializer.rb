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
    :ship_price,
    :status,
    :image_url,
    :place_category_id,
    :total_comments,
    :total_images,
    :owner_email,
    :price_range,
    :rating_average

  belongs_to :place_category

  def rating_average
    return I18n.t("places.rating_average.n_a") unless object.user_ratings.nil?
    object.user_ratings.each do |rating|
      @points += rating.point
    end
    @points / object.user_ratings.size
  end

  def price_range
    "chua co khoang gia" unless object.foods.nil?
    all_prices = object.foods.pluck(:price)
    "#{all_prices.min}-#{all_prices.max}"
  end

  def owner_email
    object.owner.email
  end

  def total_comments
    object.comments.size
  end

  def total_images
    object.place_images.size
  end
end
