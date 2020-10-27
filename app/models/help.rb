class Help < ApplicationRecord
  belongs_to :user
  has_many :accepted_helps, dependent: :destroy
end
