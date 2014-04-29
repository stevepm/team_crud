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

  scenario 'users cannot add a video without a youtube url' do
    visit '/videos/new'

    fill_in 'video_url', :with => 'vimeo.com'
    fill_in 'video_description', :with => 'Mitt Romney'
    fill_in 'video_rating', :with => '3'
    click_on 'Create Video'
    expect(page).to have_content("Url must come from Youtube")
    expect(page).to_not have_selector 'iframe'
  end

  scenario 'users cannot add a video with a blank description' do
    visit '/videos/new'

    fill_in 'video_url', :with => 'https://www.youtube.com/watch?v=yTCRwi71_ns'
    fill_in 'video_rating', :with => '3'
    click_on 'Create Video'
    expect(page).to have_content("Description can't be blank")
    expect(page).to_not have_selector 'iframe'
  end

  scenario 'user can see links for all of the videos displayed' do
    visit '/'

    click_on 'All Videos'
    click_on 'New Video'

    fill_in 'video_url', :with => 'https://www.youtube.com/watch?v=yTCRwi71_ns'
    fill_in 'video_description', :with => 'Mitt Romney'
    fill_in 'video_rating', :with => '3'
    click_on 'Create Video'
    visit '/videos/new'
    fill_in 'video_url', :with => 'http://youtu.be/OydqR_7_DjI'
    fill_in 'video_description', :with => 'No glasses'
    fill_in 'video_rating', :with => '5'
    click_on 'Create Video'

    visit '/'
    click_on 'All Videos'
    expect(page).to have_content 'https://www.youtube.com/watch?v=yTCRwi71_ns'
    expect(page).to have_content 'http://youtu.be/OydqR_7_DjI'
  end

  scenario 'user can edit a video' do
    visit '/'

    click_on 'All Videos'
    click_on 'New Video'

    fill_in 'video_url', :with => 'https://www.youtube.com/watch?v=LW863DOXqZQ'
    fill_in 'video_description', :with => 'Transforming your data with Ruby'
    fill_in 'video_rating', :with => '2'
    click_on 'Create Video'

    click_on 'Edit'

    expect(page).to have_field('video_url', with: 'https://www.youtube.com/watch?v=LW863DOXqZQ')
    expect(page).to have_field('video_description', with: 'Transforming your data with Ruby')
    expect(page).to have_field('video_rating', with: '2')
    expect(page).to have_button 'Update Video'
  end
end