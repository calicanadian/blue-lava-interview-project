class AddYearToStatusLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :status_logs, :year, :string
  end
end
