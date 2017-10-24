class Song < ApplicationRecord
  belongs_to :user
  has_many :recordings

  include PublicActivity::Model
  tracked owner: :user, only: %i[create]
end
