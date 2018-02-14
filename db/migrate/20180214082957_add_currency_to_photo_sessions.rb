class AddCurrencyToPhotoSessions < ActiveRecord::Migration[5.1]
  def change
    add_reference :photo_sessions, :currency, foreign_key: true
  end
end
