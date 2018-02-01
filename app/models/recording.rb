class Recording < ApplicationRecord
  include PublicActivity::Model
  tracked owner: :user, only: %i[create]

  belongs_to :user
  belongs_to :song

  has_attached_file :audio

  validates :title, presence: true, uniqueness: { scope: :song }

  validates_attachment_content_type :audio, content_type: ['audio/mpeg', 'audio/wav']
end
