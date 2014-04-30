class Video < ActiveRecord::Base
  validates :url, presence: true
  validates :url, format: {
    with: /(https?:\/\/youtu.be\/)|(https?:\/\/www.youtube.com\/watch\?v=)/,
    message: "must come from Youtube"}
  validates :description, presence: true
  validates :rating, :numericality => {:only_integer => true, :message => 'Rating must be a number between 0 and 5'}
  validates :rating, :inclusion => {:in => (0..5), :message => 'Rating must be a number between 0 and 5'}
end