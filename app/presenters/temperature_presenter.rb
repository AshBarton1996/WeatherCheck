class TemperaturePresenter
  include HTTParty

  def initialize()
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
    response = HTTParty.get('https://api.weatherapi.com/v1/current.json?key=55b7fdf17805493199a143223212409&q=ip130sr&days=0')
    temperature = response['current']['temp_c']
    temperature
  end

  def postcode_check

  end

end
