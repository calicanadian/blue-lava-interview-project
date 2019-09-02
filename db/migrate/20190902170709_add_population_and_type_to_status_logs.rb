class AddPopulationAndTypeToStatusLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :status_logs, :population, :integer
    add_column :status_logs, :result_type, :string
  end
end
