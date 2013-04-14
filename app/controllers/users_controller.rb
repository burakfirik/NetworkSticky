class UsersController < ApplicationController

  def index
    @users = User.shareable_to(current_user)
    
    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

end
