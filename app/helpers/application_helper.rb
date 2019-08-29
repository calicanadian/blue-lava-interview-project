module ApplicationHelper

  def year
    @year.gsub(/\D/, '') unless @year.blank?
  end

  def population
    @population
  end

end
