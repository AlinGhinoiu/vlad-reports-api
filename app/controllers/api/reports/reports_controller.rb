class Api::Reports::ReportsController < ApplicationController
  def leaderboard
    results = ActiveRecord::Base.connection.execute(query)

    render json: results
  end

  def query
    "SELECT p.email, p.sector, COUNT(p.sector) AS count FROM submissions s
    LEFT JOIN profiles p ON s.results->>'emailmembru' = p.email
    WHERE p.sector IS NOT NULL
    GROUP BY p.sector, p.email
    ORDER BY count DESC"
  end
end
