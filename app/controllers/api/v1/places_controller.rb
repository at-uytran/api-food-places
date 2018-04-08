module Api
  module V1
    class PlacesController < ApplicationController
      before_action :load_place, only: %i(show)

      def index
        @places = Place.created_desc
        @places = create_serialize @places
        render json: {message: "", data: {places: @places}}, status: 200
      end

      def show
        render json: {place: @place}
      end

      private

      def load_place
        @place = Place.find_by id: params[:id]
        return if @place
        render json: {message: t("places.load_place.not_found")}
      end
    end
  end
end
