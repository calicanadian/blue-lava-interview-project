class TheLogz
  def self.log(year, url, params, population)
    status = ''
    code = ''
    type = ''
    if year.blank?
      status = 'No year detected!'
      code = '404'
      type = ''
    elsif year == 0
      status = 'Year out of range (min)'
      code = '422'
      type = 'calculated'
    elsif year > 2500
      status = 'Year out of range (max)'
      code = '422'
      type = 'calculated'
    else
      status = 'Population found'
      code = '302'
      if year%10 == 0
        type = 'exact'
      else
        type = 'calculated'
      end
    end
    StatusLog.create!(year: year.to_s, status: status, response_code: code, request_url: url, log: params, population: population, result_type: type)
  end
end
