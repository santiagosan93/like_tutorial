class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def likes
    @likes = current_user.get_up_voted(Place)
  end
end
