class Population < ApplicationRecord

  def self.min_year
    Population.all.map(&:year).min.year
  end

  def self.max_year
    Population.all.map(&:year).max.year
  end

  def self.caclulate_growth(year)
    # This was inspired by https://stackoverflow.com/a/33908554/6605631
    # It uses the exponential growth model as we don't have enough
    # information to use the logistic model (birth and death rate)
    year = (year > 2500) ? 2500 : year
    population = Population.find_by_year(Date.new(max_year)).population
    calc_pop = population
    ((year - max_year) + 1).times {|x| calc_pop = (x*population)-(9-x)**2 }
    return calc_pop
  end

  def self.get_population(year)
    year1 = (year - year%10)
    year2 = (year - year%10) + 10
    pop1 = Population.find_by_year(Date.new(year1)).population
    pop2 = Population.find_by_year(Date.new(year2)).population
    if year2 > max_year
      # modify the modulo 10 of the year to a decimal for population multiplication
      population = (pop1 * (year%10 * 0.1).round(1)) + pop1
    else
      # modify the modulo 10 of the year to a decimal for population multiplication
      population = ((pop2 - pop1) * (year%10 * 0.1).round(1)) + pop1
    end
    return population.round
  end

  def self.get(year)
    year = year.to_i

    return 0 if year < min_year
    return Population.find_by_year(Date.new(year)).population if year == min_year || year == max_year
    if year > max_year
      pop = caclulate_growth(year)
      return pop
    end

    pop = nil
    until pop
      pop = get_population(year)
      year = year - 1
    end

    return pop if pop

    nil
  end

end
