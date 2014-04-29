require 'spec_helper'

feature 'picture management' do
  scenario 'users can create and view a new picture' do
    visit '/pictures'

    click_link 'New Picture'

    fill_in 'url', with: "http://wac.450f.edgecastcdn.net/80450F/kyssfm.com/files/2012/10/cat-4-Brit.jpg"
    fill_in 'description', with: "Cats\nThey are neat."
    fill_in 'rating', with: "4"

    click_button "Create Picture"

    expect(page).to have_content "Picture successfully created"
    expect(page).to have_content "http://wac.450f.edgecastcdn.net/80450F/kyssfm.com/files/2012/10/cat-4-Brit.jpg"
    expect(page).to have_content "Cats\nThey are neat."
    expect(page).to have_content "Rating: 4 out of 5"
    page.should have_css("img[src='http://wac.450f.edgecastcdn.net/80450F/kyssfm.com/files/2012/10/cat-4-Brit.jpg']")

    test_id = current_path.match(/\d+/)

    visit '/pictures'

    click_link 'New Picture'

    fill_in 'url', with: ""
    fill_in 'description', with: ""
    fill_in 'rating', with: "4"
    click_button "Create Picture"

    expect(current_url).to eq('http://www.example.com/pictures')
    expect(page).to have_content('URL cannot be blank')
    expect(page).to have_content('Description cannot be blank')
    page.should have_css("input[value='4']")

    visit '/'

    click_link 'All Pictures'

    page.should have_css("img[src='http://wac.450f.edgecastcdn.net/80450F/kyssfm.com/files/2012/10/cat-4-Brit.jpg']")
    click_link "show_#{test_id}"

    expect(current_url).to eq("http://www.example.com/pictures/#{test_id}")

    expect(page).to have_no_content "Picture successfully created"
    expect(page).to have_content "http://wac.450f.edgecastcdn.net/80450F/kyssfm.com/files/2012/10/cat-4-Brit.jpg"
    expect(page).to have_content "Cats\nThey are neat."
    expect(page).to have_content "Rating: 4 out of 5"
    page.should have_css("img[src='http://wac.450f.edgecastcdn.net/80450F/kyssfm.com/files/2012/10/cat-4-Brit.jpg']")
  end

  scenario 'Users must enter a valid URL' do
    visit '/pictures'
    click_link 'New Picture'

    fill_in 'url', with: "jawjkd"
    fill_in 'description', with: "Cats\nThey are neat."
    fill_in 'rating', with: "4"

    click_button "Create Picture"

    expect(page).to have_content 'URL must be valid'

    visit '/pictures'
    click_link 'New Picture'

    fill_in 'url', with: "www.google.com"
    fill_in 'description', with: "Cats\nThey are neat."
    fill_in 'rating', with: "4"

    click_button "Create Picture"

    expect(page).to have_content 'URL must be valid'

    fill_in 'url', with: "http://wac.450f.edgecastcdn.net/80450F/kyssfm.com/files/2012/10/cat-4-Brit.jpg"
    fill_in 'description', with: "Cats\nThey are neat."
    fill_in 'rating', with: "4"

    click_button "Create Picture"

    expect(page).to have_content "Picture successfully created"
    expect(page).to have_content "http://wac.450f.edgecastcdn.net/80450F/kyssfm.com/files/2012/10/cat-4-Brit.jpg"
    expect(page).to have_content "Cats\nThey are neat."
    expect(page).to have_content "Rating: 4 out of 5"
    page.should have_css("img[src='http://wac.450f.edgecastcdn.net/80450F/kyssfm.com/files/2012/10/cat-4-Brit.jpg']")

  end

  scenario 'user can edit a picture' do
    visit '/pictures'

    click_link 'New Picture'

    fill_in 'url', with: "http://wac.450f.edgecastcdn.net/80450F/kyssfm.com/files/2012/10/cat-4-Brit.jpg"
    fill_in 'description', with: "Cats\nThey are neat."
    fill_in 'rating', with: "4"
    click_button "Create Picture"
    click_on "Edit"
    page.should have_css("input[value='http://wac.450f.edgecastcdn.net/80450F/kyssfm.com/files/2012/10/cat-4-Brit.jpg']")
    expect(page).to have_content "Cats\nThey are neat."
    page.should have_css("input[value='4']")

    fill_in 'url', with: ""
    fill_in 'description', with: "Cats\nThey are neat."
    fill_in 'rating', with: "4"
    click_button "Edit"
    expect(page).to have_content('URL cannot be blank')

    fill_in 'url', with: "http://wac.450f.edgecastcdn.net/80450F/kyssfm.com/files/2012/10/cat-4-Brit.jpg"
    fill_in 'description', with: "Cats\nThey are super neat."
    fill_in 'rating', with: "5"
    click_button "Edit"

    expect(page).to have_content "Picture successfully edited"
    expect(page).to have_content "http://wac.450f.edgecastcdn.net/80450F/kyssfm.com/files/2012/10/cat-4-Brit.jpg"
    expect(page).to have_content "Cats\nThey are super neat."
    expect(page).to have_content "Rating: 5 out of 5"
  end
end