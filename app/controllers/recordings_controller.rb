class RecordingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recording, only: [:show, :edit, :update, :destroy]

  def index
    @recordings = Recording.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @song = Song.find(params[:song_id])
    @recording = Recording.new(song: @song)
  end

  def edit
  end

  def create
    @song = Song.find(params[:song_id])
    @recording = Recording.new(recording_params)
    @recording.user = current_user

    respond_to do |format|
      if @recording.save
        format.html { redirect_to @recording, notice: 'Recording was successfully created.' }
        format.json { render :show, status: :created, location: @recording }
      else
        format.html { render :new }
        format.json { render json: @recording.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @recording.update(recording_params)
        format.html { redirect_to @recording, notice: 'Recording was successfully updated.' }
        format.json { render :show, status: :ok, location: @recording }
      else
        format.html { render :edit }
        format.json { render json: @recording.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recording.destroy
    respond_to do |format|
      format.html { redirect_to recordings_url, notice: 'Recording was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recording
      @recording = Recording.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recording_params
      params.require(:recording).permit(:title, :description, :user_id, :song_id, :audio)
    end
end
