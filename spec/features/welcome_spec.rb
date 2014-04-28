require 'spec_helper'

feature 'welcome page' do
  scenario 'users can visit the homepage and visit pictures and videos' do
    visit '/'

    click_on 'Pictures'
    expect(current_url).to eq('http://www.example.com/pictures')
    visit '/'
    click_on 'All Videos'
    expect(current_url).to eq('http://www.example.com/videos')
  end

  scenario 'users can view new video form' do
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
  end
end