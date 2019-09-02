class TheLogz
  def self.log(year, url, params)
    status = ''
    code = ''
    if year.blank?
      status = 'No year detected!'
      code = '404'
    elsif year == 0
      status = 'Year out of range (min)'
      code = '422'
    elsif year > 2500
      status = 'Year out of range (max)'
      code = '422'
    else
      status = 'Population found'
      code = '302'
    end
    StatusLog.create!(status: status, response_code: code, request_url: url, log: params)
  end
end
