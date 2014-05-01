module InstagramResponses
  def self.media_search
    File.read("media_search.json")
  end
end