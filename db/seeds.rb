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

CSV.foreach('db/csv/profit_losses.csv', headers: true).each_slice(50) do |rows|
  profit_losses = []
  rows.each do |row|
    profit_losses << {
      ticker: row['ticker'].to_s,
      fiscal_period: row['fiscal_period'].to_s,
      net_sales: row['net_sales'].to_s,
      net_operating_profit: row['net_operating_profit'].to_s,
      ordinary_profit: row['ordinary_profit'].to_s,
      net_profit: row['net_profit'].to_s,
      roe: row['roe'].to_s
    }
  end
  ProfitLoss.insert_all profit_losses
end

CSV.foreach('db/csv/cashflows.csv', headers: true).each_slice(50) do |rows|
  cashflows = []
  rows.each do |row|
    cashflows << {
      ticker: row['ticker'].to_s,
      fiscal_period: row['fiscal_period'].to_s,
      cfo: row['cfo'].to_s,
      cfi: row['cfi'].to_s,
      cff: row['cff'].to_s
    }
  end
  Cashflow.insert_all cashflows
end

