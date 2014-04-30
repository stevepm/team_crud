require 'spec_helper'

describe Picture do
  it 'accepts ratings between 0 and 5' do
    test = Picture.new(:url => 'http://media-cache-cd0.pinimg.com/236x/e4/6a/f7/e46af7bae4b337488d3c6b9ee6756b69.jpg',
                       :description => 'testing ratings', :rating => '3')
    expect(test).to have(0).error_on(:rating)
  end

  it 'does not accept ratings between 0 and 5' do
    test = Picture.new(:url => 'http://media-cache-cd0.pinimg.com/236x/e4/6a/f7/e46af7bae4b337488d3c6b9ee6756b69.jpg',
                          :description => 'testing ratings', :rating => '6')
    expect(test).to have(1).error_on(:rating)
  end
end