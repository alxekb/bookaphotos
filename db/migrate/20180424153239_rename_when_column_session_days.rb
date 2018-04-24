class RenameWhenColumnSessionDays < ActiveRecord::Migration[5.1]
  def up
    rename_column :session_days, :when, :start_time
  end

  def down
    rename_column :session_days, :start_time, :when
  end
end
