class PlacesController < ApplicationController
  before_action :set_place, except: :index
  def index
    @places = Place.includes(:user).all
  end

  def like
    @place.liked_by current_user
    render_heart
  end

  def unlike
    @place.unliked_by current_user
    render_heart
  end

  private

  def render_heart
    render json: {
      heart: render_to_string(
        partial: 'places/heart.html.erb',
        locals: { place: @place}
      )
    }
  end

  def set_place
    @place = Place.find(params[:id])
  end
end



