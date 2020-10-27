class User < ApplicationRecord
  has_secure_password
  validates_presence_of :email
  validates_uniqueness_of :email
  has_one_attached :governmentId
  has_many :helps, dependent: :destroy
  has_many :accepted_helps, dependent: :destroy
end
