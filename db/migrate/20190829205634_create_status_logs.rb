class CreateStatusLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :status_logs do |t|
      t.string :status
      t.string :response_code
      t.string :request_url
      t.string :log

      t.timestamps
    end
  end
end
