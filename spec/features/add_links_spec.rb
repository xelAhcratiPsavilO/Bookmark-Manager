feature 'Adding links to the existing list' do
  scenario 'A user can add links' do
    visit '/'
      fill_in :link_url, with: 'www.mock_test.com'
      click_on 'Add link'
      expect(page).to have_content 'www.mock_test.com'
  end 
end
