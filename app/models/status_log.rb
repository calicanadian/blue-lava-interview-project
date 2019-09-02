class StatusLog < ApplicationRecord

  def self.get_exact_visits
    # count of visits to each population of exact year (1900, 1910, etc)
    sql_string = <<-EOS
      SELECT COUNT(status_logs.id) AS visits, populations.id, populations.year, status_logs.population, status_logs.result_type
      FROM populations
      JOIN status_logs ON date(populations.year, '%Y') = status_logs.year
      WHERE status_logs.result_type = 'exact'
      ORDER BY populations.year ASC
    EOS

    return ActiveRecord::Base.connection.execute(sql_string)
  end
end


# "TO_CHAR((users.created_at - interval '8 hour'), 'YYYY-MM-DD HH:MI AM PST') ILIKE '%#{Arel.sql(search.gsub("'", "''"))}%'"
