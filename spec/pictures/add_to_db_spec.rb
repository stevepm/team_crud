require 'spec_helper'

describe 'Pictures DB' do
  it 'adds pictures to db' do
    picture = Picture.new(:url => 'http://wac.450f.edgecastcdn.net/80450F/kyssfm.com/files/2012/10/cat-4-Brit.jpg', :description => 'Cat',
    :rating => 4)
    picture.save
    picture_1 = Picture.find(picture.id)
    expect(picture_1.rating).to eq(4)
    expect(picture_1.url).to eq('http://wac.450f.edgecastcdn.net/80450F/kyssfm.com/files/2012/10/cat-4-Brit.jpg')
  end
end