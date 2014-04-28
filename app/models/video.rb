class Video < ActiveRecord::Base
  validates :url, presence: true
  validates :url, format: {
    with: /(https?:\/\/youtu.be\/)|(https?:\/\/www.youtube.com\/watch\?v=)/,
    message: "Url must come from Youtube"}
end