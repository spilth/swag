class CreateRecordings < ActiveRecord::Migration[5.1]
  def change
    create_table :recordings do |t|
      t.text :description
      t.references :user, foreign_key: true
      t.references :song, foreign_key: true

      t.timestamps
    end
  end
end
