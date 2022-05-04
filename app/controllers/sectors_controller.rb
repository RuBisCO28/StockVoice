class SectorsController < ApplicationController
  def index
    sectors = if params[:country].present?
                Sector.where(country: params[:country]).order(:id)
              else
                Sector.all.order(:id)
              end
    contents = sectors.map do |sector|
      {
        id: sector.id,
        japanese: sector.japanese,
        english: sector.english,
      }
    end

    render status: :ok, json: {
      contents:,
    }
  end
end
