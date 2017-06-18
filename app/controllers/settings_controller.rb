class SettingsController < ApplicationController
  def index
    @event_places = EventPlace.all

    render json: { event_places: @event_places }
  end
end