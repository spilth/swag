class AddAudioToRecording < ActiveRecord::Migration[5.1]
  def up
    add_attachment :recordings, :audio
  end

  def down
    remove_attachment :recordings, :audio
  end
end
