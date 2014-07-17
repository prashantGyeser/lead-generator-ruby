class LocationChecker
  def self.preferred_location_available?(preferred_location_array, tweet_location)
    preferred_location_array.each do |location|
      return true if tweet_location.downcase.include? location.downcase
    end
    return false
  end
end