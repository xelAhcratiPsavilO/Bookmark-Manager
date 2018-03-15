feature 'Deleting a link' do
  scenario 'A user can delete a link' do
    visit('/')
    fill_in 'url', with: 'https://www.bb.co.uk'
    fill_in 'title', with: 'bb'
    click_button 'Add link'
    fill_in 'title_delete', with: 'bb'
    click_button 'Delete'
    expect(page).not_to have_content 'bb'
  end
end
