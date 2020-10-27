class AddAcceptedHelpIdToConversation < ActiveRecord::Migration[6.0]
  def change
    add_reference :conversations, :accepted_help, foreign_key: true
  end
end
