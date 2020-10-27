class AddDefaultValueToAcceptedHelps < ActiveRecord::Migration[6.0]
  def change
    add_column :accepted_helps, :active, :boolean, default: true
  end
end
