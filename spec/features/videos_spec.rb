require 'spec_helper'

feature 'video management' do
  scenario 'users can add a new video' do
    visit '/'
    click_on 'All Videos'
    click_on 'New Video'

    fill_in 'video_url', :with => 'https://www.youtube.com/watch?v=yTCRwi71_ns'
    fill_in 'video_description', :with => 'Mitt Romney'
    fill_in 'video_rating', :with => '3'
    click_on 'Create Video'
    expect(page).to have_content('Video successfully created')
    expect(page).to have_content('https://www.youtube.com/watch?v=yTCRwi71_ns')
    expect(page).to have_content('Mitt Romney')
    expect(page).to have_content('3')
    expect(page).to have_selector 'iframe'
  end
  scenario 'users cannot add a video with a blank url' do
    visit '/videos/new'

    fill_in 'video_description', :with => 'Mitt Romney'
    fill_in 'video_rating', :with => '3'
    click_on 'Create Video'
    expect(page).to have_content("Url can't be blank")
    expect(page).to_not have_selector 'iframe'
  end
end