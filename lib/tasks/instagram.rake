require 'instagram'

namespace :instagram do
  task :import => :environment do
    Instagram.configure do |config|
      config.client_id = ENV["INSTAGRAM_CLIENT_ID"]
      config.client_secret = ENV["INSTAGRAM_CLIENT_SECRET"]
    end
    client = Instagram.client
    media_items = client.media_search("40.0176335", "-105.2819911")
    media_items.each do |media_item|
      picture = media_item.images.standard_resolution.url
      if media_item.caption.nil?
        description = "N/A"
      else
        description = media_item.caption.text
      end
      rating = 0
      Picture.create!(:url => picture, :description => description, :rating => rating)
    end
  end
end
