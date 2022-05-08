class StocksController < ApplicationController
  def index
    return { company: {}, stocks: [] } if params[:company_id].blank?

    company = Company.find_by(ticker: params[:company_id])
    stocks = Stock.where(ticker: params[:company_id])

    stocks_responses = stocks.map do |stock|
      [stock.trade_date,stock.open,stock.close,stock.low,stock.high,stock.volume]
    end

    render status: :ok, json: {
      company: company.as_json,
      stocks: stocks_responses,
    }
  end
end
