class SharedNotesController < ApplicationController

  def create

    if params[:email] == current_user.email
      render json: {:status => "error", :error_description => "You can't share note to self."}
    elsif User.find_by_email(params[:email]).blank?
      render json: {:status => "error", :error_description => "The email address does not exist."}
    else
      if User.shareable_to?(params[:email], params[:shared_note][:note_id])
        @user = User.find_by_email(params[:email])
        @shared_note = @user.shared_notes.build(params[:shared_note])
        if @shared_note.save
          @note = current_user.notes.find(@shared_note.note_id)
          render json: {:status => "success", :note => @note}
        else
          render json: {:status => "error", :error_description => "The note could not be shared."}
        end
      else
        render json: {:status => "error", :error_description => "The note is already shared to #{params[:email]}."}
      end
    end
  end

end
