class LocationChecker
  def self.preferred_location_available?(tweet_location)
    preferred_location_array = ['nyc', 'new york', 'manhattan', 'queens', 'long island', 'hoboken', 'brooklyn', 'jersey' ]
    preferred_location_array.each do |location|
      unless tweet_location.nil?
        return true if tweet_location.downcase.include? location.downcase
      end
    end
    return false
  end
end