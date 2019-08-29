class PopulationsController < ApplicationController
  def index
    @year = params[:year].blank? ? nil : params[:year].gsub(/\D/, '')
    @population = Population.get(@year)
  end

  def show
    @year = params[:year].gsub(/\D/, '')
    @population = Population.get(@year)
  end
end
