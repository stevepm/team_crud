class Video < ActiveRecord::Base
  validates :url, presence: true
  validates :url, format: {
    with: /(https?:\/\/youtu.be\/)|(https?:\/\/www.youtube.com\/watch\?v=)/,
    message: "must come from Youtube"}
  validates :description, presence: true
end