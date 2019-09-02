class PopulationsController < ApplicationController
  def index
    @year = params[:year].blank? ? nil : params[:year].gsub(/\D/, '')
    @population = Population.get(@year)
    TheLogz.log(@year.blank? ? nil : @year.to_i, "/populations?year=#{@year}", params)
  end

  def show
    @year = params[:year].gsub(/\D/, '')
    @population = Population.get(@year)
  end
end
