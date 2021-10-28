class TemperaturePresenter
  include HTTParty

  def initialize(postcode)
    # @postcode = postcode_reformat(:postcode)
    @response = ("https://api.weatherapi.com/v1/current.json?key=55b7fdf17805493199a143223212409" + "&#{@postcode}")
  end

  def hot_definition
    "Anything above 20 degrees. Getting to the hot as balls range"
  end

  def warm_definition
    "Anything between 10 and 20 degrees. Maybe a temperature english people won't actually moan about."
  end

  def cold_definition
    "Anything below 10 degrees. Much lower and Pengu would be comfortable."
  end

  def postcode_temperature
    @response['current']['temp_c'] ? uk_postcode_valid(@postcode) : 'Please enter a valid UK postcode'
    # base_uri = 'https://api.weatherapi.com/v1/current.json?key=55b7fdf17805493199a143223212409')
    # response = base_uri + "&#{@postcode}"
    # response = HTTParty.get('https://api.weatherapi.com/v1/current.json?key=55b7fdf17805493199a143223212409&q=ip130sr')
    temperature = @response['current']['temp_c']
    temperature
  end

  def uk_postcode_valid
    case @response
    when @response['error'].present?
      false
    when @reponse['location']['country'] != 'UK'
      false
    else
      true
    end

    # true ? @response['error'].blank? : false
  end

  def postcode_reformat(postcode)
    reformatted_postcode = postcode.gsub(/\s+/, "").downcase
    reformatted_postcode
  end

end
