class AddAssociationsToLocationsAndCities < ActiveRecord::Migration[5.1]
  def up
    add_reference :locations, :city, index: true
    add_reference :session_days, :location, index: true
  end

  def down
    remove_reference :locations, :city
    remove_reference :session_days, :location
  end
end
