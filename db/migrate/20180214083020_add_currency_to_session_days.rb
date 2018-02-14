class AddCurrencyToSessionDays < ActiveRecord::Migration[5.1]
  def change
    add_reference :session_days, :currency, foreign_key: true
  end
end
