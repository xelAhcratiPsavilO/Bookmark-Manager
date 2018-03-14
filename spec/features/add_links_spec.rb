feature 'Adding links to the existing list' do

  scenario 'A user can add links' do
    visit '/'
      fill_in :url, with: 'https://www.bbc.co.uk'
      click_on 'Add link'
      expect(page).to have_content 'https://www.bbc.co.uk'
  end

  scenario 'A user receives an error if the given url is not valid' do
    visit '/'
      fill_in :url, with: 'non valid url'
      click_on 'Add link'
      expect(page).to have_content 'You must submit a valid URL.'
  end

end
