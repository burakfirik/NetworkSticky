class NotesController < ApplicationController
  before_filter :find_note, :only => [:show, :edit, :update, :destroy]
  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @notes}
    end
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
<<<<<<< HEAD
      format.json { render json: {:note => @note, :contents => @note.contents, :shared => @note.shared_to?(current_user), :owner => @note.owner} }
=======
      format.json { render json: @note, :include => :contents}
>>>>>>> 36a2f3959683644bcb532aad8e692ce805cf3d76
    end
  end

  # GET /notes/new
  # GET /notes/new.json
  def new
    @note = current_user.notes.new
    @content = @note.contents.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @note }
    end
  end

  # GET /notes/1/edit
  def edit
    render 'notes/edit', layout: false
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = current_user.notes.new(params[:note])

    respond_to do |format|
      if @note.save
        format.html { redirect_to root_path, notice: 'Note was successfully created.' }
        format.json { render json: @note, status: :created, location: @note }
      else
        format.html { render action: "new" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /notes/1
  # PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to root_path, notice: 'Note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy

    respond_to do |format|
      format.html { redirect_to notes_url, notice: "Successfully deleted note." }
      format.json { head :no_content }
    end
  end

<<<<<<< HEAD
  def share
    @shared_note = SharedNote.new
    render json: {:form => render_to_string(:partial => "notes/share")}
  end

  def shared
    shared = SharedNote.find(:all, :conditions => {:user_id => current_user.id}).collect {|s| s.note_id }
    if shared.blank?
      @notes = []
    else
      #@notes = Note.where("id IN (?)", "#{shared.join(',')}")
      @notes = Note.where(:id => shared)
    end
  end

  def all
    @notes = current_user.all_notes
  end

  private
    def find_note
      @note = Note.find(params[:id])
=======
  private
    def find_note
      @note = current_user.notes.find(params[:id])
>>>>>>> 36a2f3959683644bcb532aad8e692ce805cf3d76
    end
end
