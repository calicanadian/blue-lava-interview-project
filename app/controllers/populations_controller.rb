class PopulationsController < ApplicationController
  def index
  end

  def show
    @year = params[:year].gsub(/\D/, '')
    @population = Population.get(@year)
  end
end
