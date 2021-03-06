class Picture < ActiveRecord::Base
  validates :url, :presence => {:message => 'URL cannot be blank'}
  validates :description, :presence => {:message => 'Description cannot be blank'}
  validates :url, format: {
    with: /(https?:\/\/)?(www.)?((\w*)\.)+(\w){2,6}([\/\w\-\+])*(?i)(\.ani|\.bmp|\.cal|\.fax|\.gif|\.img|\.jbg|\.jpe|\.jpeg|\.jpg|\.mac|\.pbm|\.pcd|\.pcx|\.pct|\.pgm|\.png|\.ppm|\.psd|\.ras|\.tga|\.tiff|\.wmf)/,
    message: "URL must be valid"}
  validates :rating, :numericality => {:only_integer => true, :message => 'Rating must be a number between 0 and 5'}
  validates :rating, :inclusion => {:in => (0..5), :message => 'Rating must be a number between 0 and 5'}
end