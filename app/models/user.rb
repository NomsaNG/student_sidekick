class User < ApplicationRecord
  has_one_attached :photo

  VALID_GENDERS = ["Male", "Female", "Other"]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :username, presence: true
  validates :first_name, :last_name, presence: true
  validates :gender, inclusion: { in: VALID_GENDERS }
end
