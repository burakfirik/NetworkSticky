class HomeController < ApplicationController
  def index
    if user_signed_in?
      @notes = current_user.notes
      render 'notes/index'
    else
      render 'home/index'
    end
  end
end
