# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Hot, warm or cold', type: :feature do
  scenario 'search a valid UK postcode' do
    visit '/weather'

    expect(page).to have_text('Is it hot or not?')
    expect(page).to have_text('Anything above 20 degrees. Getting to the hot as balls range.')
    expect(page).to have_text("Anything between 10 and 20 degrees. Maybe a temperature english people won't actually moan about.")
    expect(page).to have_text('Anything below 10 degrees. Much lower and Pengu would be comfortable.')

    fill_in 'query', with: 'CT6 6YY'
    click_on 'Search'

    expect(page).to have_text('The temperature is')
  end

  scenario 'search an invalid UK postcode' do
    visit '/weather'

    expect(page).to have_text('Is it hot or not?')

    fill_in 'query', with: 'CT6 PENGU'
    click_on 'Search'

    expect(page).to have_text('Please enter a correct UK Postcode.')
  end
end
