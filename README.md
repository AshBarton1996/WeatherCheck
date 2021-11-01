# README

The index page is running on /weather.

I did not create any models or databases for this task due it only needing to return 3 definitions and API information, so instead I stored the definitions in methods in the presenter and called those methods when required. If a greater amount of information was to be stored then I would have created the database and models required to store them and access them.

spec paths are:

spec/requests/weather_spec.rb
spec/features/weather/index_spec.rb
spec/presenters/temperature_presenter_spec.rb
