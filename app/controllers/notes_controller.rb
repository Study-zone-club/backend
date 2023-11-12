class NotesController < ApplicationController
  before_action :authorize_request
  before_action :set_note, only: %i[ show update destroy ]

  # GET /notes
  def index
    @notes = @current_user.notes

    render json: @notes
  end

  # GET /notes/1
  def show
    if (@note.length == 0)
      render json: { message: "No notes to show" }, status: :not_found
    else
      render json: @note[0]
    end
  end

  # POST /notes
  def create
    @note = Note.new(note_params)
    @note.user_id = @current_user.id

    if @note.save
      render json: @note, status: :created, location: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notes/1
  def update
    if @note.length == 0
      render json: { message: "No notes to update" }, status: :not_found
    else
      if @note.update(note_params)
        render json: @note
      else
        render json: @note.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /notes/1
  def destroy
    Note.find(params[:id]).destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_note
    @note = @current_user.notes.where(id: params[:id])
  end

  # Only allow a list of trusted parameters through.
  def note_params
    params.require(:note).permit(:title, :content, :note_type, :subject_id)
  end
end
