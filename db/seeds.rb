require "csv"

CSV.foreach('db/csv/sectors.csv', headers: true) do |row|
  Sector.create!(
    japanese: row['japanese'],
    english: row['english'],
    country: row['country']
  )
end
