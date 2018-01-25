class AddTitleToRecording < ActiveRecord::Migration[5.1]
  def change
    add_column :recordings, :title, :string
  end
end
