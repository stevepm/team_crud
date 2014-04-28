require 'spec_helper'

feature 'picture management' do
  scenario 'users can create a new picture' do
    visit '/pictures'

    click_link 'New Picture'

    fill_in 'url', with: "http://wac.450f.edgecastcdn.net/80450F/kyssfm.com/files/2012/10/cat-4-Brit.jpg"
    fill_in 'description', with: "Cat"
    fill_in 'rating', with: "4"

    click_button "Add Picture"

    expect(page).to have_content "Picture successfully created"
    expect(page).to have_content "http://wac.450f.edgecastcdn.net/80450F/kyssfm.com/files/2012/10/cat-4-Brit.jpg"
    expect(page).to have_content "Cat"
    expect(page).to have_content "Rating: 4 out of 5"
    page.should have_css("img[src='http://wac.450f.edgecastcdn.net/80450F/kyssfm.com/files/2012/10/cat-4-Brit.jpg']")

    visit '/pictures'

    click_link 'New Picture'

    fill_in 'url', with: ""
    fill_in 'description', with: "Cat"
    fill_in 'rating', with: "4"
    click_button "Add Picture"

    expect(current_url).to eq('http://www.example.com/pictures')
    expect(page).to have_content('URL cannot be blank')
    expect(page).to have_content('Cat')
    page.should have_css("input[value='4']")
  end
end