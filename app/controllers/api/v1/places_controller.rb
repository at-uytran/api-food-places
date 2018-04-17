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
        @place = create_serialize @place
        render json: {message: "", data: {place: @place}}, status: 200
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
