require 'spec_helper'

describe Video do
  it 'accepts ratings between 0 and 5' do
    test = Video.new(:url => 'https://www.youtube.com/watch?v=fKmSF0sf31g',
                       :description => 'testing ratings', :rating => '3')
    expect(test).to have(0).error_on(:rating)
  end

  it 'does not accept ratings between 0 and 5' do
    test = Video.new(:url => 'https://www.youtube.com/watch?v=fKmSF0sf31g',
                          :description => 'testing ratings', :rating => '6')
    expect(test).to have(1).error_on(:rating)
  end
end