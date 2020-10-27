class CreateHelps < ActiveRecord::Migration[6.0]
  def change
    create_table :helps do |t|

      t.timestamps
    end
  end
end
