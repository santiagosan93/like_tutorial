class LikesController < ApplicationController
  before_action :set_place
  def create
    like = Like.new(place: @place, user: current_user)
    if like.save
      render_heart
    else
      render json: { message: like.errors.messages }
    end
  end

  def destroy
    like = Like.find(params[:id])
    if like.destroy
      render_heart
    else
      render json: { message: like.errors.messages }
    end
  end

  private

  def set_place
    @place = Place.find(params[:place_id])
  end

  def render_heart
    render json: {
      heart: render_to_string(partial: 'places/heart.html.erb', locals: { place: @place})
    }
  end
end
