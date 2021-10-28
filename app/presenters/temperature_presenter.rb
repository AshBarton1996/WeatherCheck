class TemperaturePresenter
  include HTTParty

  def initialize(args)
    if args[:postcode].present?
      @postcode = postcode_reformat(args[:postcode])
      @response = HTTParty.get("https://api.weatherapi.com/v1/current.json?key=55b7fdf17805493199a143223212409" + "&q=#{@postcode}")
    end
  end

  def response
    @response
  end

  def hot_definition
    "Anything above 20 degrees. Getting to the hot as balls range."
  end

  def warm_definition
    "Anything between 10 and 20 degrees. Maybe a temperature english people won't actually moan about."
  end

  def cold_definition
    "Anything below 10 degrees. Much lower and Pengu would be comfortable."
  end

  def postcode_temperature
    @response['current']['temp_c'] ? uk_postcode_valid? : 'Please enter a valid UK postcode'
    temperature = @response['current']['temp_c']
    temperature
  end

  def hot_warm_cold?
    case
    when postcode_temperature > 20
      'hot'
    when postcode_temperature >= 10 && postcode_temperature <= 20
      'warm'
    else
      'cold'
    end
  end

  def uk_postcode_valid?
    case
    when @response['error'].present?
      false
    when @response['location']['country'] != 'UK'
      false
    else
      true
    end
  end

  def postcode_reformat(postcode)
    reformatted_postcode = postcode.gsub(/\s+/, "").downcase
    reformatted_postcode
  end

  def hot_or_not_statement
    statement = ''
    if uk_postcode_valid?
      statement = ("The temperature is " + postcode_temperature.to_s + " degrees and therefor it is " + hot_warm_cold? + " in your local area.")
    else
      statement = 'Please enter a correct UK Postcode.'
    end
    statement
  end
end
