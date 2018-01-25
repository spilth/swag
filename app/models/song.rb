class Song < ApplicationRecord
  belongs_to :user
  has_many :recordings, -> { order(created_at: :desc) }

  include PublicActivity::Model
  tracked owner: :user, only: %i[create]
end
