# frozen_string_literal: true

describe 'temperature_presenter' do
  before do
    @valid_postcode_presenter = TemperaturePresenter.new(postcode: 'CT6 6YY')
    @invalid_postcode_presenter = TemperaturePresenter.new(postcode: 'CT6 6YY')
    @no_postcode_presenter = TemperaturePresenter.new(postcode: 'CT6 6YY')
  end

  describe 'uk_postcode_valid?' do
    context 'when valid uk postcode is given' do
      it 'returns true' do
        expect(@valid_postcode_presenter.uk_postcode_valid?).to eq(true)
      end
    end

    context 'when invalid uk postcode is given' do
      it 'returns false' do
        expect(@invalid_postcode_presenter.uk_postcode_valid?).to eq(false)
      end
    end

    context 'when invalid us postcode is given' do
      before do
        @invalid_us_postcode_presenter = TemperaturePresenter.new(postcode: '90210')
      end

      it 'returns false' do
        expect(@invalid_us_postcode_presenter.uk_postcode_valid?).to eq(false)
      end
    end
  end

  describe 'postcode_reformat' do
    context 'when wrong formatted postcode is given' do
      it 'returns correct formatted postcode (all lower case and no spaces)' do
        expect(@no_postcode_presenter.postcode_reformat('CT6 6YY')).to eq('ct66yy')
      end
    end
  end

  describe 'hot_or_not_statement' do
    context 'when a correct UK address has been searched' do
      before do
        @response = HTTParty.get('https://api.weatherapi.com/v1/current.json?key=55b7fdf17805493199a143223212409&q=ct66yy')
        @hot_warm_cold = @valid_postcode_presenter.hot_warm_cold?
        @postcode_temperature = @valid_postcode_presenter.postcode_temperature
      end

      it 'returns the correct weather statement' do
        expect(@valid_postcode_presenter.hot_or_not_statement).to eq("The temperature is #{@postcode_temperature} degrees and therefor it is #{@hot_warm_cold} in your local area.")
      end
    end

    context 'when an incorrext UK address has been searched' do
      it 'returns error statement' do
        expect(@invalid_postcode_presenter.hot_or_not_statement).to eq('Please enter a correct UK Postcode.')
      end
    end
  end
end
