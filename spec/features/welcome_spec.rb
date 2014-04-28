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
end