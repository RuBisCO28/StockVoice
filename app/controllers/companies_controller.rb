class CompaniesController < ApplicationController
  def index
    return { companies: [] } if params[:sector_id].blank?

    companies = Company.where(sector_id: params[:sector_id]).order(:ticker)
    return { companies: [] } if companies.nil?

    render status: :ok, json: {
      companies: companies.as_json,
    }
  end

  def show
    return { company: {}, cashflows: [] } if params[:id].blank?

    company = Company.find_by(ticker: params[:id])
    prifit_losses = ProfitLoss.where(ticker: params[:id])
    cashflows = Cashflow.where(ticker: params[:id])

    profit_losses_response = prifit_losses.map do |prifit_loss|
      {
        ticker: prifit_loss.ticker,
        fiscal_period: prifit_loss.fiscal_period.sub('/0','.'),
        net_sales: prifit_loss.net_sales == '-' ? '-' : (prifit_loss.net_sales.to_f / 1000000).ceil,
        net_operating_profit: prifit_loss.net_operating_profit == '-' ? '-' : (prifit_loss.net_operating_profit.to_f / 1000000).ceil,
        ordinary_profit: prifit_loss.ordinary_profit == '-' ? '-' : (prifit_loss.ordinary_profit.to_f / 1000000).ceil,
        net_profit: prifit_loss.net_profit == '-' ? '-' : (prifit_loss.net_profit.to_f / 1000000).ceil,
        roe: prifit_loss.roe,
        net_operating_profit_ratio: (prifit_loss.net_sales == '-') || (prifit_loss.net_operating_profit == '-') ? '-' : ((prifit_loss.net_operating_profit.to_f / prifit_loss.net_sales.to_f) * 100).ceil(1),
        ordinary_profit_ratio: (prifit_loss.net_sales == '-') || (prifit_loss.ordinary_profit == '-') ? '-' : ((prifit_loss.ordinary_profit.to_f / prifit_loss.net_sales.to_f) * 100).ceil(1),
        net_profit_ratio: (prifit_loss.net_sales == '-') || (prifit_loss.net_profit == '-') ? '-' : ((prifit_loss.net_profit.to_f / prifit_loss.net_sales.to_f) * 100).ceil(1),
      }
    end

    cashflows_response = cashflows.map do |cashflow|
      {
        ticker: cashflow.ticker,
        fiscal_period: cashflow.fiscal_period.sub('/0','.'),
        cfo: cashflow.cfo == '-' ? '-' : (cashflow.cfo.to_f / 1000000).ceil,
        cfi: cashflow.cfi == '-' ? '-' : (cashflow.cfi.to_f / 1000000).ceil,
        cff: cashflow.cff == '-' ? '-' : (cashflow.cff.to_f / 1000000).ceil,
      }
    end

    render status: :ok, json: {
      company: company.as_json,
      prifit_losses: profit_losses_response,
      cashflows: cashflows_response,
    }
  end
end
