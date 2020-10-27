class Conversation < ApplicationRecord
  belongs_to :accepted_help
  has_many :messages, dependent: :destroy
end
