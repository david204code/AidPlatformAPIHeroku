class CreateHelps < ActiveRecord::Migration[6.0]
  def change
    create_table :helps do |t|
      t.string "title"
      t.text "description"
      t.string "request_type"
      t.string "location_long"
      t.string "location_lat"
      t.string "status"
      t.string "color"

      t.timestamps
    end
  end
end
