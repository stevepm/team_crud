# require 'uri'

class Picture < ActiveRecord::Base
  validates :url, :presence => {:message => 'URL cannot be blank'}
  validates :description, :presence => {:message => 'Description cannot be blank'}
  validates :url, format: {
    with: /(https?:\/\/)?(www.)?((\w*)\.)+(\w){2,6}\/?(\w)*\/?/,
    message: "URL must be valid"}
# def is_valid_url?
#   URI::regexp([])
# end

end

