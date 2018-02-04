class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :songs, -> { order(created_at: :desc)}
  has_many :recordings, -> { order(created_at: :desc) }, through: :songs
  has_many :comments, -> { order(created_at: :desc)}
end
