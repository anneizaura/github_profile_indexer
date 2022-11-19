require 'rails_helper'

RSpec.feature "Users", type: :feature do
  it 'visit the index page' do
    visit(users_path)
    expect(page).to have_current_path(users_path)
  end

  it 'Creates a new github profile' do
    VCR.use_cassette('Scrapper_CreateScrapperService/_get_from_url/when_name_and_url_params_are_present/returns_the_scraped_data.yml') do
      visit(new_user_path)
      fill_in('Name', with: 'Matz')
      fill_in('Url', with: 'https://github.com/matz')
      click_button('Create User')
    end

    expect(page).to have_content('User was successfully created.')
  end
end
