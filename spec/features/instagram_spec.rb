require 'spec_helper'

feature "instagram" do
  before do
    stub_request(:get, %r{https://api.instagram.com/v1/media/search.json}).to_return(:body => File.read(File.expand_path("./spec/support/media_search.json")))
  end

  scenario 'user can view instagram images' do
    visit '/pictures'
    click_on 'View Instagram Photos'
    expect(page).to have_css('img')
  end
end