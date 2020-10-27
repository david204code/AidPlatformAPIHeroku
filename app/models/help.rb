class Help < ApplicationRecord
  belongs_to :user
  has_many :accepted_helps, dependent: :destroy
  has_many :conversations, through: :accepted_helps
  has_many :messages, through: :conversations
end
