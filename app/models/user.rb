class User < ApplicationRecord
  has_secure_password
  has_one_attached :governmentId
  has_many :helps, dependent: :destroy
end
