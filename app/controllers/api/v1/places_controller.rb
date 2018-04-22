module Api
  module V1
    class PlacesController < ApplicationController
      before_action :load_place, only: %i(show)

      def index
        # category_ids = params :category_ids
        @q = Place.search(params[:q]).result
        @places = Place.ransack(params[:q]).result
        @places = create_serialize @places
        render json: {message: "", data: {places: @places}}, status: 200
      end

      def show
        @foods = create_serialize @place.foods.includes(:food_category)
        @comments = create_serialize @place.comments.includes(:user)
        @place = create_serialize @place
        render json: {message: "", data: {place: @place, foods: @foods, comments: @comments}}, status: 200
      end

      private

      def load_place
        @place = Place.find_by id: params[:id]
        return if @place
        render json: {message: I18n.t("places.load_place.not_found")}
      end
    end
  end
end
