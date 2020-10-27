class AddHelpIdToAcceptedHelps < ActiveRecord::Migration[6.0]
  def change
    add_reference :accepted_helps, :help, foreign_key: true
  end
end
