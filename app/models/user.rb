class User < ApplicationRecord
  has_secure_password
  validates_presence_of :email
  validates_uniqueness_of :email
  has_one_attached :governmentId
  validates :governmentId, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..5.megabytes }
  has_many :helps, dependent: :destroy
  has_many :accepted_helps, dependent: :destroy
end
