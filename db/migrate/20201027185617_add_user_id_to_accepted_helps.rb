class AddUserIdToAcceptedHelps < ActiveRecord::Migration[6.0]
  def change
    add_reference :accepted_helps, :user, foreign_key: true
  end
end
