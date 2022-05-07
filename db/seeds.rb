require "csv"

CSV.foreach('db/csv/sectors.csv', headers: true) do |row|
  Sector.create!(
    japanese: row['japanese'],
    english: row['english'],
    country: row['country']
  )
end

CSV.foreach('db/csv/companies.csv', headers: true).each_slice(50) do |rows|
  companies = []
  rows.each do |row|
    companies << {
      ticker: row['ticker'].to_s,
      japanese: row['japanese'].to_s,
      english: row['english'].to_s,
      fiscal_period: row['fiscal_period'].to_s,
      sector_id: row['sector_id'].to_s,
      country: row['country'].to_s,
      market: row['market'].to_s,
      japanese_description: row['japanese_description'].to_s,
      english_description: row['english_description'].to_s
    }
  end
  Company.insert_all companies
end

