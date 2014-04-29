require 'spec_helper'

feature 'welcome page' do
  scenario 'users can visit the homepage and visit pictures and videos' do
    visit '/'
    expect(page).to have_content 'Welcome to the media manager, where you can, well... manage some media.'

    within(:css, "#pictures_home") do
      expect(page).to have_content 'Pictures!'
      expect(page).to have_link 'View All'
      expect(page).to have_link 'Add New'

      click_on 'View All'
      expect(current_url).to eq('http://www.example.com/pictures')
    end

    visit '/'
    within(:css, "#videos_home") do
      expect(page).to have_content 'Videos!'
      expect(page).to have_link 'View All'
      expect(page).to have_link 'Add New'

      click_on 'View All'
      expect(current_url).to eq('http://www.example.com/videos')
    end
  end
end