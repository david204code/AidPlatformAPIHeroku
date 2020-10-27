class AddUserIdToHelps < ActiveRecord::Migration[6.0]
  def change
    add_reference :helps, :user, foreign_key: true
  end
end
