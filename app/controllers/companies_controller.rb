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
    return { company: {} } if params[:id].blank?

    company = Company.find_by(ticker: params[:id])
    return { company: {} } if company.nil?

    render status: :ok, json: {
      company: company.as_json,
    }
  end
end
